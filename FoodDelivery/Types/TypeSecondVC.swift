import UIKit

class TypeSecondViewController: UIViewController {
    
    var buttonBack = UIButton()
    var buttonPromo = UIButton()
    
    let imageBack = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    var labelTitle = UILabel()
    var labelBody = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        
    }
    
    func setupView(subViewVC: [UIView]) {
        for view in subViewVC { self.view.addSubview(view)}
    }
    
    func createLabel(label: UILabel, fontSize: CGFloat, textColor: UIColor, customText: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.font = UIFont(name: "Doloman Pavljenko Light", size: fontSize)
        label.text = customText
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    func createButtonText(button: UIButton,
                          text: String,
                          sizeFont: CGFloat,
                          colorForNormal: UIColor,
                          colorForHighlighted: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.setTitleColor(colorForNormal, for: .normal)
        button.setTitleColor(colorForHighlighted, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Doloman Pavljenko Light", size: sizeFont)
    }
    
    func createButtonImage(button: UIButton,
                           image: UIImage,
                           tintColor: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        button.tintColor = tintColor
    }
}
