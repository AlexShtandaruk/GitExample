import UIKit
import AVKit

class LoginPageViewController: FaceViewController, UITextFieldDelegate {
    
    @IBOutlet var player: AVPlayer!
    
    private let imageEye = UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    private let imageEyeSlash = UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    private let imageFaceID = UIImage(systemName: "faceid", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
    private let imageClose = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    
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
    
    private lazy var toggleButton = UIButton()
    
    private lazy var closeButton = UIButton()
    
    private lazy var faceIDButton = UIButton()
    
    private lazy var signInButton = UIButton()
    
    private var labelSignature = UILabel()
    
    private var labelSignIn = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        createButton(button: toggleButton, image: imageEye!, title: "")
        createButton(button: faceIDButton, image: imageFaceID!, title: "")
        createButton(button: closeButton, image: imageClose!, title: "")
        createButton(button: signInButton, image: UIImage(), title: "Sign in now")
        signInButton.layer.cornerRadius = 10
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        toggleButton.addTarget(self, action: #selector(pressedEyeButton), for: .touchUpInside)
        faceIDButton.addTarget(self, action: #selector(pressedFaceIDButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(pressedCloseButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(pressedButtonSingIn), for: .touchUpInside)
        
        createLabel(label: labelSignature, text: "Created by Alex Shtandaruk", textColor: .white, textSize: 20)
        createLabel(label: labelSignIn, text: "If you don't have account", textColor: .white, textSize: 20)
        
        passwordTextField.rightView = toggleButton
        passwordTextField.rightViewMode = .always
        setupView()
        setupConstraint()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player.pause()
    }
    
    func createButton(button: UIButton, image: UIImage, title: String) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitle(title, for: .normal)
        
    }
    
    func createLabel(label: UILabel, text: String, textColor: UIColor, textSize: CGFloat) {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.font = UIFont(name: "Doloman Pavljenko Light", size: textSize)
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
    }
    
    func setupView() {
        
        view.addSubview(videoView)
        playVideo()
        videoView.addSubview(loginTextField)
        videoView.addSubview(passwordTextField)
        videoView.addSubview(faceIDButton)
        videoView.addSubview(statusLabel)
        videoView.addSubview(closeButton)
        videoView.addSubview(labelSignature)
        videoView.addSubview(signInButton)
        videoView.addSubview(labelSignIn)
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
        
        faceIDButton.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor).isActive = true
        faceIDButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 70).isActive = true
        
        labelSignIn.topAnchor.constraint(equalTo: faceIDButton.bottomAnchor, constant: 10).isActive = true
        labelSignIn.centerXAnchor.constraint(equalTo: faceIDButton.centerXAnchor).isActive = true
        labelSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: labelSignIn.bottomAnchor).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: labelSignIn.centerXAnchor).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        statusLabel.centerXAnchor.constraint(equalTo: faceIDButton.centerXAnchor).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: faceIDButton.centerYAnchor, constant: 70).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelSignature.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        labelSignature.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelSignature.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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

        NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil,
                                               queue: nil) {
            notification in
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
    
    @objc func pressedButtonSingIn() {
        
        navigationController?.pushViewController(SingInViewController(), animated: true)
        
    }
}
