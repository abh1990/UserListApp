import UIKit
import Combine

class UserListViewController: UIViewController {
    
    
    private var tableView: UITableView!
    
    let loader = UIActivityIndicatorView(style: .large)
    
    var cancellables = Set<AnyCancellable>()
    
    private var dataSource: UITableViewDiffableDataSource<Int, User>!
    
    var viewModel: UserListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setupTableView()
        setupLoader()
        Task { await viewModel?.loadUsersList() }
    }
    
    func setupLoader() {
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .gray // Customize color
        tableView.addSubview(loader)
        
        // Center the loader in the view
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        
        dataSource = UITableViewDiffableDataSource<Int, User>(tableView: tableView) {
            (tableView, indexPath, user) -> UITableViewCell? in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: "\(user.firstName) \(user.lastName)", and: user.email)
            
            return cell
        }
    }
    
    private func applySnapshot(_ users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
        snapshot.appendSections([0])
        snapshot.appendItems(users)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func bindViewModel() {
        
        viewModel?.$users
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapshot(self?.viewModel?.users ?? [])
            }.store(in: &cancellables)
        
        viewModel?.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                self?.loader.isHidden = !isLoading
                isLoading ? self?.loader.startAnimating() : self?.loader.stopAnimating()
            }.store(in: &cancellables)
        
        viewModel?.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { msg in
                if let msg {
                    AlertManager.showConfirmationAlert(on: self, title: "Error", message: msg, confirmTitle: "Retry", cancelTitle: "Cancel", onConfirm:  {
                        Task { await self.viewModel?.loadUsersList() }
                    })
                }
            }.store(in: &cancellables)
    }
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = viewModel?.users[indexPath.row]
        let detailVM = UserDetailViewModel(userDetails: UserDetails(fullName: "\(user?.firstName ?? "") \(user?.lastName ?? "")", email: user?.email ?? "", imageUrl: user?.image ?? ""))
        let detailVC = UserDetailViewController()
        detailVC.viewModel = detailVM
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
