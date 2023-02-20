import UIKit

class Sale2ViewController: UIViewController {
    
    private var progressViewFirst = UIProgressView()
    private var progressViewSecond = UIProgressView()
    
    private var buttonLeft: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    private var buttonRight: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    
    private var timer = Timer()
    
    private lazy var subViewVC: [UIView] = [self.buttonLeft,
                                            self.buttonRight,
                                            self.progressViewFirst,
                                            self.progressViewSecond]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createProgressView(progressView: progressViewFirst)
        createProgressView(progressView: progressViewSecond)
        
        createTimer()
        
        buttonRight.addTarget(self, action: #selector(pressedRightSide), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(pressedLeftSide), for: .touchUpInside)
        
        setupView(subView: subViewVC)
        
        setupConstraint()
        setupGesture()
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
        } else {
            dismissView()
        }
    }
    
    @objc func pressedLeftSide(recognizer: UITapGestureRecognizer) {
        
        if progressViewFirst.progress != 1.0 {
            progressViewFirst.progress = 0.0
        } else if progressViewSecond.progress != 0.2 {
            progressViewSecond.progress = 0.0
            progressViewFirst.progress = 0.0
        } else if progressViewSecond.progress != 1.0 {
            progressViewSecond.progress = 0.0
        }
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
        transition.duration = 0.3
        transition.type = .fade
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
        
    }
    
    private func createTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateProgressView),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateProgressView() {
        
        if progressViewFirst.progress != 1.0 {
            progressViewFirst.progress += 0.01
        } else {
            UIView.animate(withDuration: 0.8) {
                if self.progressViewSecond.progress != 1.0 {
                    self.progressViewSecond.progress += 0.01
                } else {
                    UIView.animate(withDuration: 0.8) {
                        self.timer.invalidate()
                        self.tabBarController?.tabBar.isHidden = false
                        self.dismissView()
                    }
                }
            }
        }
    }
}
