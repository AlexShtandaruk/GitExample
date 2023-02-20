import UIKit

class ExViewController: UIViewController {
    
    private var label: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose a payment method"
        label.textColor = .red
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 24)
        label.numberOfLines = 0
//        label.backgroundColor = .green
        label.lineBreakMode = .byWordWrapping
        return label
       
    }()
    
    private var button: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cash", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        createGesture()
    }
    
    private func createGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        //сколько раз необходимо нажать для того чтобы жест отработал
        button.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc private func tapped(){
        
        let popVC = TableViewController()
        popVC.modalPresentationStyle = .popover
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.sourceView = self.button
        // кто является источником
        popVC.popoverPresentationController?.sourceRect = CGRect(x: self.button.bounds.midX, y: self.button.bounds.midY, width: 0, height: 0)
        // место появления нашей таблицы
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        
        self.present(popVC, animated: true)
        
    }
}

extension ExViewController: UIPopoverPresentationControllerDelegate {
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
