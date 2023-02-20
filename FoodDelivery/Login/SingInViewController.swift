import UIKit
import AVKit

class SingInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var buttonBack = UIButton()
    private lazy var buttonSingIn = UIButton()
    private lazy var buttonCheckBoxPolicy = UIButton()
    private lazy var buttonCheckBoxTerms = UIButton()
    
    private lazy var imageBack = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    private lazy var imageCheckBoxOff = UIImage(systemName: "checkmark.rectangle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    private lazy var imageCheckBoxOn = UIImage(systemName: "checkmark.rectangle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
    
    private lazy var textFieldName = UITextField()
    private lazy var textFieldLastName = UITextField()
    private lazy var textFieldEmail = UITextField()
    private lazy var textFieldPassword = UITextField()
    private lazy var textFieldPasswordAgain = UITextField()
   
    private lazy var labelTitle = UILabel()
    private lazy var labelBody = UILabel()
    private lazy var labelName = UILabel()
    private lazy var labelLastName = UILabel()
    private lazy var labelEMail = UILabel()
    private lazy var labelPassword = UILabel()
    private lazy var labelPasswordAgain = UILabel()
    private lazy var labelPolicy = UILabel()
    private lazy var labelTerms = UILabel()
    
    private lazy var labelInfo: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.layer.cornerRadius = 30
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Fill in all the data"
        label.font = fontLabel
        label.isHidden = true
        return label
    }()
    
    private let fontTitle = UIFont(name: "Supertalls", size: 50)
    private let fontBody = UIFont(name: "Supertalls", size: 40)
    private let fontLabel = UIFont(name: "Supertalls", size: 20)
    private let fontRules = UIFont(name: "Doloman Pavljenko Light", size: 20)
    private let fontTextField = UIFont(name: "Doloman Pavljenko Light", size: 25)
    
    private var contentSize = CGSize()

    private lazy var scrollViewVC: UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        
        let contentView = UIView()
        contentView.frame.size = contentSize
        contentView.backgroundColor = .clear
        return contentView
    }()
   
    var isSelectedPolicy: Bool = false {
        didSet {
            if isSelectedPolicy {
                buttonCheckBoxPolicy.setImage(imageCheckBoxOn, for: .normal)
            } else {
                buttonCheckBoxPolicy.setImage(imageCheckBoxOff, for: .normal)
            }
        }
    }
    
    var isSelectedTerms: Bool = false {
        didSet {
            if isSelectedTerms {
                buttonCheckBoxTerms.setImage(imageCheckBoxOn, for: .normal)
            } else {
                buttonCheckBoxTerms.setImage(imageCheckBoxOff, for: .normal)
            }
        }
    }
    
    @IBOutlet var player: AVPlayer!
    
    private lazy var videoView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
//    private let blurEffect = UIBlurEffect(style: .prominent)
//
//    private let blurView: UIVisualEffectView = {
//
//        let blur = UIVisualEffectView()
//        blur.translatesAutoresizingMaskIntoConstraints = false
//        blur.clipsToBounds = true
//        return blur
//    }()
    
    private lazy var subView: [UIView] = [self.buttonBack,
                                          self.labelTitle,
                                          self.labelBody,
                                          self.labelName,
                                          self.textFieldName,
                                          self.labelLastName,
                                          self.textFieldLastName,
                                          self.labelEMail,
                                          self.textFieldEmail,
                                          self.labelPassword,
                                          self.textFieldPassword,
                                          self.labelPasswordAgain,
                                          self.textFieldPasswordAgain,
                                          self.buttonCheckBoxPolicy,
                                          self.labelPolicy,
                                          self.buttonCheckBoxTerms,
                                          self.labelTerms,
                                          self.buttonSingIn,
                                          self.labelInfo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        createTextField(textField: textFieldName, textPlaceholder: "Name", font: fontTextField!)
        createTextField(textField: textFieldLastName, textPlaceholder: "Last name", font: fontTextField!)
        createTextField(textField: textFieldEmail, textPlaceholder: "E-mail", font: fontTextField!)
        createTextField(textField: textFieldPassword , textPlaceholder: "Password", font: fontTextField!)
        createTextField(textField: textFieldPasswordAgain , textPlaceholder: "Password again", font: fontTextField!)
        
        createButton(button: buttonBack, image: imageBack!, title: "", color: .white, colorBorder: .clear)
        createButton(button: buttonSingIn, image: UIImage(), title: "Sing In", color: .lightGray, colorBorder: .darkGray)
        
        buttonBack.tintColor = .black
        buttonBack.addTarget(self, action: #selector(pressedButtonBack), for: .touchUpInside)
        buttonSingIn.addTarget(self, action: #selector(pressedButtonSingIn), for: .touchUpInside)
        
        createCheckBox(button: buttonCheckBoxPolicy)
        createCheckBox(button: buttonCheckBoxTerms)
        
        buttonCheckBoxPolicy.addTarget(self, action: #selector(pressedCheckBox), for: .touchUpInside)
        buttonCheckBoxTerms.addTarget(self, action: #selector(pressedCheckBox), for: .touchUpInside)
        
        createLabel(label: labelTitle, text: "Sing In", textColor: .white, font: fontTitle!)
        createLabel(label: labelBody, text: "We need some information about you", textColor: .lightGray, font: fontBody!)
        createLabel(label: labelName, text: "Write down your name:", textColor: .white, font: fontLabel!)
        createLabel(label: labelLastName, text: "Write down your last name:", textColor: .white, font: fontLabel!)
        createLabel(label: labelEMail, text: "Write down your e-mail:", textColor: .white, font: fontLabel!)
        createLabel(label: labelPassword, text: "Create password by your own:", textColor: .white, font: fontLabel!)
        createLabel(label: labelPasswordAgain, text: "Repeat the entered password:", textColor: .white, font: fontLabel!)
        createLabel(label: labelPolicy, text: "I agree with the company's policy on the management of your personal data.", textColor: .white, font: fontRules!)
        createLabel(label: labelTerms, text: "I agree with the user agreement on violation of the rules for using the applicationю.", textColor: .white, font: fontRules!)
        
        labelTitle.backgroundColor = .clear
        labelBody.backgroundColor = .clear
        
//        blurView.effect = blurEffect
        
        view.addSubview(videoView)
        playVideo()
//        videoView.addSubview(blurView)
        videoView.addSubview(scrollViewVC)
        scrollViewVC.addSubview(contentView)
        setupView(subViewVC: subView)
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
    
    func showMessage() {
        
        labelInfo.alpha = 1
        labelInfo.isHidden = false
        UIView.animate(withDuration: 2.0) {
            self.labelInfo.alpha = 0
        }
        
    }
    
    
    func setupView(subViewVC: [UIView]) {
        for view in subViewVC { self.contentView.addSubview(view)}
    }
    
    func setupConstraint() {
        
        videoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        videoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        videoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
//        blurView.topAnchor.constraint(equalTo: videoView.topAnchor).isActive = true
//        blurView.leadingAnchor.constraint(equalTo: videoView.leadingAnchor).isActive = true
//        blurView.trailingAnchor.constraint(equalTo: videoView.trailingAnchor).isActive = true
//        blurView.bottomAnchor.constraint(equalTo: videoView.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
        buttonBack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: 10).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor).isActive = true
        labelBody.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        labelName.topAnchor.constraint(equalTo: labelBody.bottomAnchor, constant: 10).isActive = true
        labelName.leadingAnchor.constraint(equalTo: labelBody.leadingAnchor).isActive = true
        labelName.trailingAnchor.constraint(equalTo: labelBody.trailingAnchor).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10).isActive = true
        textFieldName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        textFieldName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        textFieldName.heightAnchor.constraint(equalToConstant: 50).isActive = true

        labelLastName.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10).isActive = true
        labelLastName.leadingAnchor.constraint(equalTo: labelName.leadingAnchor).isActive = true
        labelLastName.trailingAnchor.constraint(equalTo: labelName.trailingAnchor).isActive = true
        labelLastName.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldLastName.topAnchor.constraint(equalTo: labelLastName.bottomAnchor, constant: 10).isActive = true
        textFieldLastName.leadingAnchor.constraint(equalTo: textFieldName.leadingAnchor).isActive = true
        textFieldLastName.trailingAnchor.constraint(equalTo: textFieldName.trailingAnchor).isActive = true
        textFieldLastName.heightAnchor.constraint(equalToConstant: 50).isActive = true

        labelEMail.topAnchor.constraint(equalTo: textFieldLastName.bottomAnchor, constant: 10).isActive = true
        labelEMail.leadingAnchor.constraint(equalTo: labelLastName.leadingAnchor).isActive = true
        labelEMail.trailingAnchor.constraint(equalTo: labelLastName.trailingAnchor).isActive = true
        labelEMail.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldEmail.topAnchor.constraint(equalTo: labelEMail.bottomAnchor, constant: 10).isActive = true
        textFieldEmail.leadingAnchor.constraint(equalTo: textFieldLastName.leadingAnchor).isActive = true
        textFieldEmail.trailingAnchor.constraint(equalTo: textFieldLastName.trailingAnchor).isActive = true
        textFieldEmail.heightAnchor.constraint(equalToConstant: 50).isActive = true

        labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 10).isActive = true
        labelPassword.leadingAnchor.constraint(equalTo: labelEMail.leadingAnchor).isActive = true
        labelPassword.trailingAnchor.constraint(equalTo: labelEMail.trailingAnchor).isActive = true
        labelPassword.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 10).isActive = true
        textFieldPassword.leadingAnchor.constraint(equalTo: textFieldEmail.leadingAnchor).isActive = true
        textFieldPassword.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: 50).isActive = true

        labelPasswordAgain.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10).isActive = true
        labelPasswordAgain.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor).isActive = true
        labelPasswordAgain.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor).isActive = true
        labelPasswordAgain.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldPasswordAgain.topAnchor.constraint(equalTo: labelPasswordAgain.bottomAnchor, constant: 10).isActive = true
        textFieldPasswordAgain.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor).isActive = true
        textFieldPasswordAgain.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor).isActive = true
        textFieldPasswordAgain.heightAnchor.constraint(equalToConstant: 50).isActive = true

        buttonCheckBoxPolicy.topAnchor.constraint(equalTo: textFieldPasswordAgain.bottomAnchor, constant: 10).isActive = true
        buttonCheckBoxPolicy.leadingAnchor.constraint(equalTo: textFieldPasswordAgain.leadingAnchor).isActive = true
        buttonCheckBoxPolicy.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonCheckBoxPolicy.heightAnchor.constraint(equalToConstant: 40).isActive = true

        labelPolicy.centerYAnchor.constraint(equalTo: buttonCheckBoxPolicy.centerYAnchor).isActive = true
        labelPolicy.leadingAnchor.constraint(equalTo: buttonCheckBoxPolicy.trailingAnchor, constant: 10).isActive = true
        labelPolicy.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor).isActive = true
        labelPolicy.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonCheckBoxTerms.topAnchor.constraint(equalTo: buttonCheckBoxPolicy.bottomAnchor, constant: 10).isActive = true
        buttonCheckBoxTerms.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor).isActive = true
        buttonCheckBoxTerms.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonCheckBoxTerms.heightAnchor.constraint(equalToConstant: 40).isActive = true

        labelTerms.centerYAnchor.constraint(equalTo: buttonCheckBoxTerms.centerYAnchor).isActive = true
        labelTerms.leadingAnchor.constraint(equalTo: buttonCheckBoxTerms.trailingAnchor, constant: 10).isActive = true
        labelTerms.trailingAnchor.constraint(equalTo: textFieldEmail.trailingAnchor).isActive = true
        labelTerms.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonSingIn.topAnchor.constraint(equalTo: labelTerms.bottomAnchor, constant: 30).isActive = true
        buttonSingIn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        buttonSingIn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonSingIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelInfo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        labelInfo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func createTextField(textField: UITextField, textPlaceholder: String,font: UIFont) {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = font
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: textPlaceholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.contentMode = .scaleAspectFill
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 3
        textField.delegate = self
        textField.tag = 2
        textField.returnKeyType = .next
    }
    
    func createButton(button: UIButton, image: UIImage, title: String, color: UIColor, colorBorder: UIColor) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = colorBorder.cgColor
        button.contentMode = .center
    }
    
    func createCheckBox(button: UIButton) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(imageCheckBoxOff, for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleToFill
    }
    
    func createLabel(label: UILabel, text: String, textColor: UIColor, font: UIFont) {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.font = font
        label.text = text
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    func playVideo() {
        
        guard let path = Bundle.main.path(forResource: "VideoSignIn", ofType: "mp4") else {
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
    
    func dismissView() {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
    }

    
    @objc func pressedButtonBack() {
        dismissView()
        
    }
    
    @objc func pressedButtonSingIn() {

        if textFieldName.text?.isEmpty == true {
            showMessage()
        } else if textFieldLastName.text?.isEmpty == true {
            showMessage()
        } else if textFieldEmail.text?.isEmpty == true {
            showMessage()
        } else if textFieldPassword.text?.isEmpty == true {
            showMessage()
        }  else if textFieldPasswordAgain.text?.isEmpty == true {
            showMessage()
        }  else if isSelectedTerms == false {
            showMessage()
        }  else if isSelectedPolicy == false {
            showMessage()
        } else {
            navigationController?.pushViewController(MainViewController(), animated: false)
            tabBarController?.tabBar.isHidden = false
            tabBarItem.index(ofAccessibilityElement: 0)
        }
        
    }
    
    @objc func pressedCheckBox(_ sender: UIButton) {
        
        if sender == buttonCheckBoxPolicy {
            isSelectedPolicy.toggle()
        }
        
        if sender == buttonCheckBoxTerms {
            isSelectedTerms.toggle()
        }
    }
    
    
}
