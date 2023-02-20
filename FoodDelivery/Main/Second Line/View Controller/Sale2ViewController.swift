import UIKit

class Sale2ViewController: UIViewController {
    
    private var progressViewFirst = UIProgressView()
    private var progressViewSecond = UIProgressView()
    
    private var imageView: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var labelTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .customRed
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 60)
        label.textAlignment = .left
        return label
    }()
    
    private var labelBody: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 40)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var data: [[String:String]] =
    [
        ["image":"sale2im1", "title":"Restaurants", "body":"Explore a large selection of great food"],
        ["image":"sale2im2", "title":"Get promocode", "body":"Get a promo code for a discount on your first order right now!"]
    ]
    
    private var buttonOrder: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.customRed, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.customRed.cgColor
        button.layer.borderWidth = 3
        return button
        
    }()
    
    private var buttonLeft: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private var buttonRight: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private var timer = Timer()
    
    private lazy var subViewVC: [UIView] = [self.buttonLeft,
                                            self.buttonRight,
                                            self.progressViewFirst,
                                            self.progressViewSecond,
                                            self.buttonOrder,
                                            self.labelTitle,
                                            self.labelBody,
                                            self.imageView]
    
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        createProgressView(progressView: progressViewFirst)
        createProgressView(progressView: progressViewSecond)
        
        createTimer()
        
        buttonRight.addTarget(self, action: #selector(pressedRightSide), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(pressedLeftSide), for: .touchUpInside)
        buttonOrder.addTarget(self, action: #selector(pressedButtonOrder), for: .touchUpInside)
        
        setupView(subView: subViewVC)
        
        setupConstraint()
        setupGesture()
        loadData(selectedRow: row)
    }
    
    
    private func setupView(subView: [UIView]) {
        
        for view in subViewVC { self.view.addSubview(view)}
        
    }
    
    private func setupConstraint() {
        
        buttonLeft.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        buttonLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonLeft.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonLeft.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        buttonRight.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        buttonRight.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonRight.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonRight.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        progressViewFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        progressViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        progressViewFirst.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        
        progressViewSecond.topAnchor.constraint(equalTo: progressViewFirst.topAnchor).isActive = true
        progressViewSecond.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        progressViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        buttonOrder.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        buttonOrder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonOrder.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonOrder.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: progressViewFirst.topAnchor, constant: 100).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor).isActive = true
        labelBody.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageView.topAnchor.constraint(equalTo: labelBody.bottomAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: labelBody.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: labelBody.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    private func createProgressView(progressView: UIProgressView) {
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .customRed
        progressView.trackTintColor = .darkGray
        progressView.setProgress(0.0, animated: true)
        
    }
    
    func setupGesture() {
        
        let singleTapGestureRight = UITapGestureRecognizer(target: self, action: #selector(pressedRightSide(recognizer:)))
        singleTapGestureRight.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGestureRight)
        
        let singleTapGestureLeft = UITapGestureRecognizer(target: self, action: #selector(pressedLeftSide(recognizer:)))
        singleTapGestureLeft.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGestureLeft)
        
        let rightSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
    }
    
    @objc func pressedRightSide(recognizer: UITapGestureRecognizer) {
        if progressViewFirst.progress != 1.0 {
            progressViewFirst.progress = 1.0
            loadData(selectedRow: row)
        } else {
            dismissView()
        }
    }
    
    @objc func pressedLeftSide(recognizer: UITapGestureRecognizer) {
        
        if progressViewFirst.progress != 1.0 {
            progressViewFirst.progress = 0.0
        } else if progressViewSecond.progress != 1.0 {
            if progressViewSecond.progress < 0.1 {
                progressViewSecond.progress = 0.0
                progressViewFirst.progress = 0.0
            } else if progressViewSecond.progress > 0.1 {
                progressViewSecond.progress = 0.0
            }
        }
        loadData(selectedRow: row)
    }
    
    @objc func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        
        let direction: UISwipeGestureRecognizer.Direction = recognizer.direction
        
        switch direction {
        case UISwipeGestureRecognizer.Direction.right:
            dismissView()
        case UISwipeGestureRecognizer.Direction.left:
            dismissView()
        default:
            break
        }
    }
    
    func dismissView() {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = .fade
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func createTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateProgressView),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    func loadData(selectedRow: Int) {
        
        if progressViewFirst.progress != 1.0 {
            row = 0
            imageView.image = UIImage(named: data[row]["image"]!)
            labelTitle.text = data[row]["title"]
            labelBody.text = data[row]["body"]
        } else if progressViewFirst.progress == 1.0 {
            row = 1
            imageView.image = UIImage(named: data[row]["image"]!)
            labelTitle.text = data[row]["title"]
            labelBody.text = data[row]["body"]
        }
        showAnimation()
    }
    
    func showAnimation() {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
            self.labelTitle.transform = CGAffineTransform(translationX: 0,
                                                          y: self.view.frame.size.height)
            
        })
        { (_) in
            UIView.animate(withDuration: 1.0,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                self.labelTitle.alpha = 1
                self.labelTitle.transform = CGAffineTransform(translationX: 0,
                                                              y: 0)
            })
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
            self.labelBody.transform = CGAffineTransform(translationX: self.view.frame.size.width,
                                                          y: 0)
            
        })
        { (_) in
            UIView.animate(withDuration: 1.0,
                           delay: 0.5,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                self.labelBody.alpha = 1
                self.labelBody.transform = CGAffineTransform(translationX: 0,
                                                              y: 0)
            })
        }
    }
    
    func hideAnimatiom() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
            self.labelTitle.alpha = 0
            self.labelBody.alpha = 0
        })
    }
    
    @objc func updateProgressView() {
        
        if progressViewFirst.progress != 1.0 {
            self.buttonOrder.setTitle("Make order", for: .normal)
            progressViewFirst.progress += 0.01
        } else {
            UIView.animate(withDuration: 0.5) {
                if self.progressViewSecond.progress != 1.0 {
                    self.buttonOrder.setTitle("Get promo", for: .normal)
                    self.progressViewSecond.progress += 0.01
                } else {
                    UIView.animate(withDuration: 0.5) {
                        self.timer.invalidate()
                        self.dismissView()
                    }
                }
            }
        }
    }
    
    @objc func pressedButtonOrder() {
        
        if progressViewFirst.progress != 1.0 {
            dismissView()
            tabBarController?.selectedIndex = 1
        } else {
            dismissView()
            navigationController?.pushViewController(Sale1ViewController(), animated: true)
        }
    }
    
}
