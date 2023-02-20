import UIKit

class Sale1ViewController: TypeSecondViewController {
    
    private lazy var labelInfo: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.layer.cornerRadius = 30
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Promocode seccussed copied!"
        label.font = UIFont(name: "Supertalls", size: 30)
        label.isHidden = true
        return label
    }()
    
    private lazy var subView: [UIView] = [self.labelInfo,
                                          self.buttonBack,
                                          self.labelTitle,
                                          self.labelBody,
                                          self.buttonPromo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtonImage(button: buttonBack,
                          image: imageBack!,
                          tintColor: .customRed)
        createButtonImage(button: buttonPromo,
                          image: imagePromo!,
                          tintColor: .clear)
        
        buttonBack.addTarget(self, action: #selector(pressedButtonBack), for: .touchUpInside)
        buttonPromo.addTarget(self, action: #selector(pressedButtonPromo), for: .touchUpInside)
        buttonPromo.layer.cornerRadius = 30
        buttonPromo.layer.borderWidth = 3
        buttonPromo.layer.borderColor = UIColor.black.cgColor
        
        createLabel(label: labelTitle,
                    fontSize: 30,
                    textColor: .customRed,
                    customText: "Your first order with amazing sale!")
        createLabel(label: labelBody,
                    fontSize: 20,
                    textColor: .black,
                    customText: "In these restaurants you will get a $5 discount for orders over $15")
        
        setupView(subViewVC: subView)
        setupConstraint()
        
    }
    
    func setupConstraint() {
        
        buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 25).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: buttonBack.bottomAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor).isActive = true
        labelBody.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buttonPromo.topAnchor.constraint(equalTo: labelBody.bottomAnchor, constant: 10).isActive = true
        buttonPromo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        buttonPromo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        buttonPromo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        labelInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        labelInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        labelInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        labelInfo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func showMessage() {
        
        labelInfo.alpha = 1
        labelInfo.isHidden = false
        UIView.animate(withDuration: 2.0) {
            self.labelInfo.alpha = 0
        }
        
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
    
    @objc func pressedButtonPromo() {
        
        showMessage()
        
    }
    
}

