import UIKit
 
class DefaultViewController: UIViewController {
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        showAlert()
    }
 
        private func showAlert() {
            AlertManager.showAlert(on: self, title: "Warning", message: "Device is rooted, app can't run on jailbroken devices")
    }
}

 
