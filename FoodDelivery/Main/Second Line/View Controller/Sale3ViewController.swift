import UIKit

class Sale3ViewController: TypeSecondViewController {
    
    let imagePromo = UIImage(named: "pizzaPhoto")
    
    private lazy var subView: [UIView] = [self.buttonBack,
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
        
        createLabel(label: labelTitle,
                    fontSize: 45,
                    textColor: .customRed,
                    customText: "PIZZZAAAA sale!")
        labelTitle.textAlignment = .center
        createLabel(label: labelBody,
                    fontSize: 30,
                    textColor: .black,
                    customText: "Buy 3 slices and get a set of drinks and fries!")
        
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
        labelTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor).isActive = true
        labelBody.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonPromo.topAnchor.constraint(equalTo: labelBody.bottomAnchor, constant: 10).isActive = true
        buttonPromo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        buttonPromo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        buttonPromo.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
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
        
    }
    
}

