import UIKit

class ModalAnimationVC: UIViewController {

    private var button: UIButton = {
        
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
        setupView()
        setupConstraint()
        
    }
    
    func setupView() {
        
        view.addSubview(button)
        
    }
    
    func setupConstraint() {
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func tappedButton() {
        presentingViewController?.dismiss(animated: true)
        
    }

}

