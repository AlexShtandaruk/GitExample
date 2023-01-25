import UIKit

class СaloriesViewController: UIViewController {
    
    let shapeLoading = CAShapeLayer()
    let shapeTrake = CAShapeLayer()
    
    var circlePath = UIBezierPath()
    
    var possitionCircleX = Double()
    var possitionCircleY = Double()
    
    let buttonActivity = UIButton()
    
    let imageButtonActivity = UIImage(systemName: "goforward",
                                      withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        possitionCircleX = view.center.x
        possitionCircleY = view.center.y
        
        circlePath = UIBezierPath(arcCenter: CGPoint(x: possitionCircleX,
                                                     y: possitionCircleY),
                                  radius: 50,
                                  startAngle: -(.pi / 2),
                                  endAngle: .pi * 2,
                                  clockwise: true)
        
        createShape(path: circlePath,
                    shape: shapeTrake,
                    strokeColor: UIColor.lightGray,
                    strokeEnd: 1)
        createShape(path: circlePath,
                    shape: shapeLoading,
                    strokeColor: UIColor.black,
                    strokeEnd: 0)
        
        createButton(button: buttonActivity,
                     image: imageButtonActivity!,
                     text: "Activity",
                     textColor: .customRed)
        buttonActivity.addTarget(self, action: #selector(pressedButtonActivity), for: .touchUpInside)
    }
    
    func setupView() {
        
        view.layer.addSublayer(shapeTrake)
        view.layer.addSublayer(shapeLoading)
        view.addSubview(buttonActivity)
        
    }
    
    func setupConstrait() {
        
        buttonActivity.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        buttonActivity.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        
    }
    
    func createShape(path: UIBezierPath,
                     shape: CAShapeLayer,
                     strokeColor: UIColor,
                     strokeEnd: CGFloat) {
        
        shape.path = path.cgPath
        shape.lineWidth = 5
        shape.strokeEnd = strokeEnd
        shape.strokeColor = strokeColor.cgColor
        shape.fillColor = UIColor.clear.cgColor
    }
    
    func createButton(button: UIButton, image: UIImage, text: String, textColor: UIColor) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        
    }
    
    @objc func pressedButtonActivity() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 4
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        
        shapeLoading.add(animation, forKey: "Animation")
    }
    
    
}
