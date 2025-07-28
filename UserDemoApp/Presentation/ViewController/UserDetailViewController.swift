import UIKit
import Combine
 
class UserDetailViewController: UIViewController {
 
     let imgViewUser: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()
 
     let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
 
    internal let lblEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
 
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel: UserDetailViewModel?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        bindViewModel()
    }
 
    private func setupViews() {
        view.addSubview(imgViewUser)
        view.addSubview(lblName)
        view.addSubview(lblEmail)
    }
 
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imgViewUser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imgViewUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgViewUser.widthAnchor.constraint(equalToConstant: 148),
            imgViewUser.heightAnchor.constraint(equalToConstant: 120),
 
            lblName.topAnchor.constraint(equalTo: imgViewUser.bottomAnchor, constant: 45),
            lblName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            lblEmail.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10),
            lblEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lblEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        ])
    }
 
    private func bindViewModel() {
        viewModel?.$userDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userDetails in
                guard let userDetails = userDetails else { return }
                self?.lblName.text = "Name: \(userDetails.fullName)"
                self?.lblEmail.text = "Email: \(userDetails.email)"
                self?.imgViewUser.loadImage(from: userDetails.imageUrl)
            }
            .store(in: &cancellables)
    }
}
