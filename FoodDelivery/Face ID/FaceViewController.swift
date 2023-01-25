
import UIKit
import LocalAuthentication

class FaceViewController: UIViewController {
    
    var statusLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func pressedFaceIDButton() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "text 1"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        self.statusLabel.text = "Biometric status: Fail"
                        self.statusLabel.textColor = UIColor.black
                        self.showAlert(title: "Fail",
                                       message: "Try again")
                        return
                    }
                    self.statusLabel.text = "Biometric status: Log In"
                    self.statusLabel.textColor = UIColor.green
                }
            }
        } else {
            if let error {
                showAlert(title: "You can't do it",
                          message: "\(error.localizedDescription)")
            }
        }
    }
}

extension FaceViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Back", style: .cancel)
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}
