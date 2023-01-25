import UIKit

class RestaurantViewController: UIViewController {

    let shapeLoadingFirstC = CAShapeLayer()
    let shapeTrakeFirstC = CAShapeLayer()
    
    let shapeLoadingSecondC = CAShapeLayer()
    let shapeTrakeSecondC = CAShapeLayer()
    
    let shapeLoadingTheirdC = CAShapeLayer()
    let shapeTrakeTheirdC = CAShapeLayer()
    
    var circlePath = UIBezierPath()
    var circlePathTwo = UIBezierPath()
    var circlePathThree = UIBezierPath()
    
    var possitionCircleX = Double()
    var possitionCircleY = Double()
    
    var possitionCircleTwoX = Double()
    var possitionCircleTwoY = Double()
    
    var possitionCircleThreeX = Double()
    var possitionCircleThreeY = Double()
    
    var labelProtein = UILabel()
    var labelFat = UILabel()
    var labelCarbohydrate = UILabel()
    
    let buttonActivity = UIButton()
    
    var waitingTime = Timer()
    
    
    
    let imageButtonActivity = UIImage(systemName: "goforward",
                                      withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        view.backgroundColor = .white
        
        possitionCircleX = view.center.x / 2
        possitionCircleY = view.center.y / 3
        
        possitionCircleTwoX = view.center.x
        possitionCircleTwoY = view.center.y / 3
        
        possitionCircleThreeX = view.center.x * 1.5
        possitionCircleThreeY = view.center.y / 3
        
        circlePath = UIBezierPath(arcCenter: CGPoint(x: possitionCircleX,
                                                     y: possitionCircleY),
                                  radius: 40,
                                  startAngle: -(.pi / 2),
                                  endAngle: .pi * 2,
                                  clockwise: true)
        
        circlePathTwo = UIBezierPath(arcCenter: CGPoint(x: possitionCircleTwoX,
                                                        y: possitionCircleTwoY),
                                  radius: 40,
                                  startAngle: -(.pi / 2),
                                  endAngle: .pi * 2,
                                  clockwise: true)
        circlePathThree = UIBezierPath(arcCenter: CGPoint(x: possitionCircleThreeX,
                                                        y: possitionCircleThreeY),
                                  radius: 40,
                                  startAngle: -(.pi / 2),
                                  endAngle: .pi * 2,
                                  clockwise: true)
        
        createShape(path: circlePath,
                    shape: shapeTrakeFirstC,
                    strokeColor: UIColor.lightGray,
                    strokeEnd: 1)
        createShape(path: circlePath,
                    shape: shapeLoadingFirstC,
                    strokeColor: UIColor.customRed,
                    strokeEnd: 0)
        createShape(path: circlePathTwo,
                    shape: shapeTrakeSecondC,
                    strokeColor: UIColor.lightGray,
                    strokeEnd: 1)
        createShape(path: circlePathTwo,
                    shape: shapeLoadingSecondC,
                    strokeColor: UIColor.customRed,
                    strokeEnd: 0)
        createShape(path: circlePathThree,
                    shape: shapeTrakeTheirdC,
                    strokeColor: UIColor.lightGray,
                    strokeEnd: 1)
        createShape(path: circlePathThree,
                    shape: shapeLoadingTheirdC,
                    strokeColor: UIColor.customRed,
                    strokeEnd: 0)
        
        createButton(button: buttonActivity,
                     image: imageButtonActivity!,
                     imageColor: .customRed,
                     text: "Count",
                     textColor: .customRed)
        buttonActivity.addTarget(self, action: #selector(pressedButtonActivity), for: .touchUpInside)
        
        createLabel(label: labelProtein,
                    text: "P",
                    color: .customRed)
        createLabel(label: labelFat,
                    text: "F",
                    color: .customRed)
        createLabel(label: labelCarbohydrate,
                    text: "C",
                    color: .customRed)

        setupConstrait()
    }
    
    func setupView() {
        
        view.layer.addSublayer(shapeTrakeFirstC)
        view.layer.addSublayer(shapeLoadingFirstC)
        view.layer.addSublayer(shapeTrakeSecondC)
        view.layer.addSublayer(shapeLoadingSecondC)
        view.layer.addSublayer(shapeTrakeTheirdC)
        view.layer.addSublayer(shapeLoadingTheirdC)
        view.addSubview(buttonActivity)
        view.addSubview(labelProtein)
        view.addSubview(labelFat)
        view.addSubview(labelCarbohydrate)
        
    }
    
    func setupConstrait() {
        
        buttonActivity.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        buttonActivity.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        
        labelProtein.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -105).isActive = true
        labelProtein.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -305).isActive = true
        
        labelFat.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        labelFat.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -305).isActive = true
        
        labelCarbohydrate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 105).isActive = true
        labelCarbohydrate.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -305).isActive = true
        
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
    
    func createLabel(label: UILabel, text: String, color: UIColor) {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        label.text = text
        label.textColor = color
    }
    
    func createButton(button: UIButton, image: UIImage, imageColor: UIColor, text: String, textColor: UIColor) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = imageColor
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        button.setTitleColor(textColor, for: .normal)
    }
    
    func createTimer(timeInterval: Double) {
        waitingTime = Timer.scheduledTimer(timeInterval: timeInterval,
                                           target: self,
                                           selector: #selector(setNewPFC),
                                           userInfo: nil,
                                           repeats: false)
    }
    
    @objc func pressedButtonActivity() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        
        let animationTwo = CABasicAnimation(keyPath: "strokeEnd")
        animationTwo.toValue = 1
        animationTwo.duration = 1.3
        animationTwo.isRemovedOnCompletion = false
        animationTwo.fillMode = .forwards
        
        let animationThree = CABasicAnimation(keyPath: "strokeEnd")
        animationThree.toValue = 1
        animationThree.duration = 1.6
        animationThree.isRemovedOnCompletion = false
        animationThree.fillMode = .forwards
        
        shapeLoadingFirstC.add(animation, forKey: "Animation")
        shapeLoadingSecondC.add(animationTwo, forKey: "Animation")
        shapeLoadingTheirdC.add(animationThree, forKey: "Animation")
        
        createTimer(timeInterval: 1.0)
        
        createTimer(timeInterval: 1.3)
        
        createTimer(timeInterval: 1.6)
    }
    
    @objc func setNewPFC() {
        
        
        
    }
    
    
}
