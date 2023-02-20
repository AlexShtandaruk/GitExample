import UIKit

class TypeFirstViewController: UIViewController, UITextFieldDelegate {
    
    var loginButton = UIButton()
    var searchButton = UIButton()
    var buttonMenu = UIButton()
    
    let imageMenu = UIImage(systemName: "list.dash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    let imageLogin = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    let imageSearch = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    let fontSupertalls = "Supertalls"
    let fontDoloman = "Doloman Pavljenko Light"
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Doloman Pavljenko Light", size: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.contentMode = .scaleAspectFill
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.customLightGrey
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.customRed.cgColor
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.tag = 1
        textField.returnKeyType = .next
        //shadow
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 7
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowOffset = CGSize(width: 15, height: 15)
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
    }
    
    func setupView(subViewVC: [UIView]) {
        for view in subViewVC { self.view.addSubview(view)}
    }
    
    func createLayout(layout: UICollectionViewFlowLayout,
                      chosenDirection: UICollectionView.ScrollDirection,
                      minimumLineSpacing: CGFloat){
        layout.scrollDirection = chosenDirection
        layout.minimumLineSpacing = minimumLineSpacing
        layout.minimumInteritemSpacing = 1
    }
    
    func createCollectionView(collectionView: UICollectionView,
                              layout: UICollectionViewFlowLayout) {
        collectionView.frame = .zero
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func createPageController(page: UIPageControl) {
        
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.backgroundStyle = .automatic
        page.allowsContinuousInteraction = false
        page.preferredIndicatorImage = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10))
        page.pageIndicatorTintColor = .darkGray
        page.currentPageIndicatorTintColor = .customRed
        
    }
    
    func createButtonText(button: UIButton,
                          text: String,
                          sizeFont: CGFloat,
                          colorForNormal: UIColor,
                          colorForHighlighted: UIColor,
                          font: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.setTitleColor(colorForNormal, for: .normal)
        button.setTitleColor(colorForHighlighted, for: .highlighted)
        button.titleLabel?.font = UIFont(name: font, size: sizeFont)
        
    }
    func createButtonShadow(button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 15, height: 15)
    }
    
    func createButtonImage(button: UIButton,
                           image: UIImage,
                           tintColor: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
    }
    
    @objc func pressedSearchTextField() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    @objc func pressedButtonLogin() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(LoginPageViewController(), animated: true)
    }
    
}

//extension TypeFirstViewController: UIViewControllerTransitioningDelegate {
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//         return self
//    }
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }
//
//}
//
//extension TypeFirstViewController: UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 1.5
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
//        let toView = transitionContext.viewController(forKey: .to)?.view else {
//            return
//        }
//        let isPresenting = (fromView == view)
//        let presentingView = isPresenting ? toView : fromView
//        if isPresenting {
//            transitionContext.containerView.addSubview(presentingView)
//        }
//        let size = CGSize(width: UIScreen.main.bounds.width / 2.0,
//                          height: UIScreen.main.bounds.height)
//        let offScreenFrame = CGRect(origin:  CGPoint(x: -size.width , y: 0),
//                                    size: size)
//        let onScreenFrame = CGRect(origin: .zero,
//                                   size: size)
//        presentingView.frame = isPresenting ?  offScreenFrame : onScreenFrame
//        let animationDuration = transitionDuration(using: transitionContext)
//        UIView.animate(withDuration: animationDuration) {
//            presentingView.frame = isPresenting ? onScreenFrame : offScreenFrame
//        } completion: { inSuccess in
//            if !isPresenting {
//                presentingView.removeFromSuperview()
//            }
//            transitionContext.completeTransition(inSuccess)
//        }
//    }
//}



