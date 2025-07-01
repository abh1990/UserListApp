import UIKit
 
class AlertManager {
 
    /// Shows a standard alert with title, message, and an OK button.
    static func showAlert(on viewController: UIViewController,
                          title: String,
                          message: String,
                          okTitle: String = "OK",
                          completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }

/// Shows a confirmation alert with customizable buttons.
    static func showConfirmationAlert(on viewController: UIViewController,
                                      title: String,
                                      message: String,
                                      confirmTitle: String = "Yes",
                                      cancelTitle: String = "No",
                                      confirmStyle: UIAlertAction.Style = .default,
                                      cancelStyle: UIAlertAction.Style = .cancel,
                                      onConfirm: (() -> Void)? = nil,
                                      onCancel: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: confirmStyle) { _ in
            onConfirm?()
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: cancelStyle) { _ in
            onCancel?()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
