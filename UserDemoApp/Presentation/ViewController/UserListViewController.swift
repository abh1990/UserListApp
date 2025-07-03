import UIKit
import Combine

class UserListViewController: UIViewController {
    
    var viewModel: UserListViewModel?
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        Task { await viewModel?.loadUsersList() }
    }
    
    private func bindViewModel() {
        
        viewModel?.$users
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
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

extension UserListViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       viewModel?.users.count ?? 0
  }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
                    return UITableViewCell()
                }
        
        let user = viewModel?.users[indexPath.row]
        
        cell.configure(with: user?.name ?? "", and: user?.email ?? "")
        
        return cell
    }
}
