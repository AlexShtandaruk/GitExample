import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    private var buttonBack = UIButton()
    
    private let imageBack = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    
    private lazy var searchTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.contentMode = .scaleAspectFill
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.customLightGrey
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.customRed.cgColor
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.tag = 1
        textField.returnKeyType = .next
        //shadow
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 7
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowOffset = CGSize(width: 15, height: 15)
        
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        setupConstraint()
        createButtonImage(button: buttonBack,
                          image: imageBack!,
                          tintColor: .customRed)
        buttonBack.addTarget(self, action: #selector(pressedButtonBack), for: .touchUpInside)
        
    }
    
    func setupView() {
        view.addSubview(buttonBack)
        view.addSubview(searchTextField)
    }
    
    func setupConstraint() {
        
        buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: 10).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func createButtonImage(button: UIButton,
                           image: UIImage,
                           tintColor: UIColor) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
    }
    
    func dismissView() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
    }

    
    @objc func pressedButtonBack() {
        
        tabBarController?.tabBar.isHidden = false
        dismissView()
        
    }

}
