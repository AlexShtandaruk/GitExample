import UIKit

class CustomAnimationVC: UIViewController {

    private var button: UIButton = {
        
        let button = UIButton()
        button.setTitle("Press me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        setupView()
        setupConstraint()
        
    }
    
    func setupView() {
        
        view.addSubview(button)
        
    }
    
    func setupConstraint() {
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func tappedButton() {
        let modalViewCont = ModalVC()
        modalViewCont.modalPresentationStyle = .custom
        modalViewCont.transitioningDelegate = self
        present(modalViewCont, animated: true )
        
    }
}

extension CustomAnimationVC: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}

extension CustomAnimationVC: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
        let toView = transitionContext.viewController(forKey: .to)?.view else {
            return
        }
        let isPresenting = (fromView == view)
        let presentingView = isPresenting ? toView : fromView
        if isPresenting {
            transitionContext.containerView.addSubview(presentingView)
        }
        let size = CGSize(width: UIScreen.main.bounds.width / 2.0,
                          height: UIScreen.main.bounds.height)
        let offScreenFrame = CGRect(origin:  CGPoint(x: -size.width , y: 0),
                                    size: size)
        let onScreenFrame = CGRect(origin: .zero,
                                   size: size)
        presentingView.frame = isPresenting ?  offScreenFrame : onScreenFrame
        let animationDuration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: animationDuration) {
            presentingView.frame = isPresenting ? onScreenFrame : offScreenFrame
        } completion: { inSuccess in
            if !isPresenting {
                presentingView.removeFromSuperview()
            }
            transitionContext.completeTransition(inSuccess)
        }
    }
}

