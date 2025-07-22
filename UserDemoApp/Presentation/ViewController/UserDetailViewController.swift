
import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var imgViewUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var viewModel: UserDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpVC()
    }
    
    private func setUpVC() {
        lblName.text = "Name: \(viewModel?.fullName ?? "")"
        lblEmail.text = "Email: \(viewModel?.email ?? "")"
        imgViewUser.loadImage(from: viewModel?.imageUrl ?? "")
    }
}

extension UserDetailViewController {
    static func instantiate(with viewModel: UserDetailViewModel) -> UserDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        vc.viewModel = viewModel
        return vc
    }
}
