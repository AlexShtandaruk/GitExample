import UIKit
import AVKit

class LoginPageViewController: FaceViewController, UITextFieldDelegate {
    
   
    @IBOutlet var player: AVPlayer!
    
    private let imageEye = UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    private let imageEyeSlash = UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    private let imageFaceID = UIImage(systemName: "faceid", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
    private let imageClose = UIImage(systemName: "arrowshape.turn.up.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
    
    private lazy var isPasswordShown = false
    
    
    private lazy var videoView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var loginTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.contentMode = .scaleAspectFill
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 3
        textField.delegate = self
        textField.tag = 1
        textField.returnKeyType = .next
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.contentMode = .scaleAspectFill
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 3
        textField.delegate = self
        textField.tag = 2
        textField.returnKeyType = .next
        
        return textField
    }()
    
    private lazy var toggleButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(imageEye, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pressedEyeButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(imageClose, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pressedCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var faceIDButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(imageFaceID, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pressedFaceIDButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
        
    }
    
    func setupView() {
        
        view.addSubview(videoView)
        playVideo()
        videoView.addSubview(loginTextField)
        videoView.addSubview(passwordTextField)
        passwordTextField.addSubview(toggleButton)
        videoView.addSubview(faceIDButton)
        videoView.addSubview(statusLabel)
        videoView.addSubview(closeButton)
    }
    
    func setupConstraint() {
        
        videoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        videoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        videoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: videoView.centerXAnchor, constant: 0).isActive = true
        loginTextField.centerYAnchor.constraint(equalTo: videoView.centerYAnchor, constant: -50).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: videoView.leadingAnchor, constant: 100).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: videoView.trailingAnchor, constant: -100).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        toggleButton.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor, constant: 90).isActive = true
        toggleButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0).isActive = true
        
        faceIDButton.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor).isActive = true
        faceIDButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 70).isActive = true
        
        statusLabel.centerXAnchor.constraint(equalTo: faceIDButton.centerXAnchor).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: faceIDButton.centerYAnchor, constant: 70).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func playVideo() {
        
        guard let path = Bundle.main.path(forResource: "Video", ofType: "mp4") else {
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        var playerLayer: AVPlayerLayer?
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer?.frame = self.view.frame
        self.videoView.layer.addSublayer(playerLayer!)
        
        player.seek(to: CMTime.zero)
        player.actionAtItemEnd = .none
        self.player.play()
        
        NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil,
                                               queue: nil) {
            notification in
            print("play againg")
            self.player.seek(to: CMTime.zero)
            self.player.play()
        }
    }
    
    func setupPasswordField() {
        
        if isPasswordShown {
            passwordTextField.isSecureTextEntry = true
            toggleButton.setImage(imageEyeSlash, for: .normal)
            toggleButton.tintColor = .white
        } else {
            passwordTextField.isSecureTextEntry = false
            toggleButton.setImage(imageEye, for: .normal)
            toggleButton.tintColor = .white
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
    
    @objc func pressedEyeButton() {
        // type 1
//        if isPasswordShown == true {
//            isPasswordShown = false
//        } else {
//            isPasswordShown = true
//        }
        // type 2
        self.isPasswordShown = !self.isPasswordShown
        setupPasswordField()
    }
    
    @objc func pressedCloseButton() {
        tabBarController?.tabBar.isHidden = false
        dismissView()
    }
}
