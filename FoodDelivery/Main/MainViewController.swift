import UIKit

class MainViewController: TypeFirstViewController {
    
    private var shopButton = UIButton()
    private var shopButtonImage = UIButton()
    
    let imageShop = UIImage(systemName: "chevron.forward.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
    
    var dataCVFirstLine = [FLModel]()
    var dataCVSecondLine = [SLModel]()
    var dataCVTheirdLine = [TheirdLModel]()
    var dataCVForthLine = [ForthLModel]()
    
    private var layoutFL = UICollectionViewFlowLayout()
    private var layoutSL = UICollectionViewFlowLayout()
    private var layoutTheirdL = UICollectionViewFlowLayout()
    private var layoutForthL = UICollectionViewFlowLayout()
    
    private var collectionViewFL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var collectionViewSL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var collectionViewTheirdL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var collectionViewForthL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var pageControllFL = UIPageControl()
    
    private lazy var subView: [UIView] = [self.buttonMenu,
                                          self.loginButton,
                                          self.searchButton,
                                          self.searchTextField,
                                          self.collectionViewFL,
                                          self.pageControllFL,
                                          self.collectionViewSL,
                                          self.collectionViewTheirdL,
                                          self.shopButton,
                                          self.shopButtonImage,
                                          self.collectionViewForthL]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDelegateDataSource(collectionView: collectionViewFL)
        createDelegateDataSource(collectionView: collectionViewSL)
        createDelegateDataSource(collectionView: collectionViewTheirdL)
        createDelegateDataSource(collectionView: collectionViewForthL)
        
        createLayout(layout: layoutFL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 10)
        createLayout(layout: layoutSL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 4)
        createLayout(layout: layoutTheirdL,
                     chosenDirection: .vertical,
                     minimumLineSpacing: 4)
        createLayout(layout: layoutForthL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 4)
        
        createCollectionView(collectionView: collectionViewFL,
                             layout: layoutFL)
        createCollectionView(collectionView: collectionViewSL,
                             layout: layoutSL)
        createCollectionView(collectionView: collectionViewTheirdL,
                             layout: layoutTheirdL)
        createCollectionView(collectionView: collectionViewForthL,
                             layout: layoutForthL)
        
        collectionViewFL.register(CustomCVC.self, forCellWithReuseIdentifier: CustomCVC.reuseID)
        collectionViewSL.register(CustomTwoCVC.self, forCellWithReuseIdentifier: CustomTwoCVC.reuseID)
        collectionViewTheirdL.register(CustomTwoCVC.self, forCellWithReuseIdentifier: CustomTwoCVC.reuseID)
        collectionViewForthL.register(CustomTwoCVC.self, forCellWithReuseIdentifier: CustomTwoCVC.reuseID)
        collectionViewForthL.isPagingEnabled = false
        
        createPageController(page: pageControllFL)
        
        
        createButtonText(button: shopButton,
                         text: "Магазин",
                         sizeFont: 35,
                         colorForNormal: .customRed,
                         colorForHighlighted: .black,
                         font: fontSupertalls)
        createButtonShadow(button: shopButton)
        createButtonImage(button: buttonMenu,
                          image: imageMenu!,
                          tintColor: .customRed)
        createButtonImage(button: searchButton,
                          image: imageSearch!,
                          tintColor: .black)
        createButtonImage(button: shopButtonImage,
                          image: imageShop!,
                          tintColor: .customRed)
        createButtonImage(button: loginButton,
                          image: imageLogin!,
                          tintColor: .customRed)
        
        addAction()
        setupView(subViewVC: subView)
        setupConstraint()
        setupModel()
        pageContorollIndex()
    }
    
    func addAction() {
        searchTextField.addTarget(self, action: #selector(pressedSearchTextField), for: .touchDown)
        pageControllFL.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
        buttonMenu.addTarget(self, action: #selector(tappedButtonMenu), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(pressedButtonShop), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(pressedSearchTextField), for: .touchUpInside)
        shopButtonImage.addTarget(self, action: #selector(pressedButtonShop), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(pressedButtonLogin), for: .touchUpInside)
    }
    
    func pageContorollIndex() {
        pageControllFL.numberOfPages = dataCVFirstLine.count / 2
    }
    
    func createDelegateDataSource(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraint() {
        buttonMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        buttonMenu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        buttonMenu.heightAnchor.constraint(equalToConstant: 25).isActive = true
        buttonMenu.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: buttonMenu.centerYAnchor).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: buttonMenu.bottomAnchor, constant: 10).isActive = true
        searchButton.leftAnchor.constraint(equalTo: buttonMenu.leftAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: buttonMenu.bottomAnchor, constant: 10).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 15).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionViewFL.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15).isActive = true
        collectionViewFL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionViewFL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionViewFL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        pageControllFL.topAnchor.constraint(equalTo: collectionViewFL.bottomAnchor).isActive = true
        pageControllFL.centerXAnchor.constraint(equalTo: collectionViewFL.centerXAnchor).isActive = true
        
        collectionViewSL.topAnchor.constraint(equalTo: pageControllFL.bottomAnchor).isActive = true
        collectionViewSL.leadingAnchor.constraint(equalTo: collectionViewFL.leadingAnchor).isActive = true
        collectionViewSL.trailingAnchor.constraint(equalTo: collectionViewFL.trailingAnchor).isActive = true
        collectionViewSL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionViewTheirdL.topAnchor.constraint(equalTo: collectionViewSL.bottomAnchor, constant: 10).isActive = true
        collectionViewTheirdL.leadingAnchor.constraint(equalTo: collectionViewFL.leadingAnchor).isActive = true
        collectionViewTheirdL.trailingAnchor.constraint(equalTo: collectionViewFL.trailingAnchor).isActive = true
        collectionViewTheirdL.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        shopButton.topAnchor.constraint(equalTo: collectionViewTheirdL.bottomAnchor).isActive = true
        shopButton.leftAnchor.constraint(equalTo: collectionViewTheirdL.leftAnchor).isActive = true
        shopButton.rightAnchor.constraint(equalTo: collectionViewTheirdL.rightAnchor).isActive = true
        shopButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        shopButtonImage.centerYAnchor.constraint(equalTo: shopButton.centerYAnchor).isActive = true
        shopButtonImage.leftAnchor.constraint(equalTo: shopButton.rightAnchor, constant: -50).isActive = true
        shopButtonImage.rightAnchor.constraint(equalTo: shopButton.rightAnchor).isActive = true
        shopButtonImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionViewForthL.topAnchor.constraint(equalTo: shopButton.bottomAnchor, constant: 10).isActive = true
        collectionViewForthL.leadingAnchor.constraint(equalTo: collectionViewTheirdL.leadingAnchor).isActive = true
        collectionViewForthL.trailingAnchor.constraint(equalTo: collectionViewTheirdL.trailingAnchor).isActive = true
        collectionViewForthL.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupModel() {
        self.dataCVFirstLine = FLModel.fetchFirstLine()
        self.dataCVSecondLine = SLModel.fetchSecondLine()
        self.dataCVTheirdLine = TheirdLModel.fetchSecondLine()
        self.dataCVForthLine = ForthLModel.fetchSecondLine()
    }
    
    @objc func pressedButtonShop (_ sender: UIButton) {
        if sender == shopButton {
            tabBarController?.selectedIndex = 2
        } else if sender == shopButtonImage {
            
            tabBarController?.selectedIndex = 2
        }
    }
    
    @objc func pageDidChange() {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControllFL.currentPage)
        collectionViewFL.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    @objc func tappedButtonMenu() {
        let modal = ModalAnimationVC()
        modal.modalPresentationStyle = .custom
        modal.transitioningDelegate = self
        present(modal, animated: true )
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFL {
            return dataCVFirstLine.count
        } else if collectionView == collectionViewSL {
            return dataCVSecondLine.count
        } else if collectionView == collectionViewTheirdL {
            return dataCVTheirdLine.count
        } else if collectionView == collectionViewForthL {
            return dataCVForthLine.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVC.reuseID, for: indexPath) as! CustomCVC
            cell.mainImageView.image = dataCVFirstLine[indexPath.row].mainImageFirstLine
            cell.mainImageView.backgroundColor = .customLightGrey
            cell.mainLabel.text = dataCVFirstLine[indexPath.row].nameFirstLine
            return cell
        } else if collectionView == collectionViewSL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTwoCVC.reuseID, for: indexPath) as! CustomTwoCVC
            cell.mainImageView.image = dataCVSecondLine[indexPath.row].mainImageSecondLine
            cell.mainImageView.backgroundColor = .customLightGrey
            cell.mainImageView.contentMode = .scaleAspectFit
            return cell
        } else if collectionView == collectionViewTheirdL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTwoCVC.reuseID, for: indexPath) as! CustomTwoCVC
            cell.mainImageView.image = dataCVTheirdLine[indexPath.row].mainImageTheirdLine
            cell.mainImageView.contentMode = .scaleAspectFit
            return cell
        } else if collectionView == collectionViewForthL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTwoCVC.reuseID, for: indexPath) as! CustomTwoCVC
            cell.mainImageView.image = dataCVForthLine[indexPath.row].mainImageForthLine
            cell.mainImageView.backgroundColor = .customLightGrey
            cell.mainImageView.contentMode = .scaleAspectFit
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewFL {
            let customWidth: CGFloat = collectionViewFL.frame.width/2 - 10
            let customHeight: CGFloat = collectionViewFL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewSL {
            let customWidth: CGFloat = collectionViewSL.frame.width/3 - 4
            let customHeight: CGFloat = collectionViewSL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewTheirdL {
            let customWidth: CGFloat = collectionViewTheirdL.frame.width/1
            let customHeight: CGFloat = collectionViewTheirdL.frame.height - 4
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewForthL {
            let customWidth: CGFloat = collectionViewForthL.frame.width/2 - 4
            let customHeight: CGFloat = collectionViewForthL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewFL {
            
        } else if collectionView == collectionViewSL {
            if indexPath.row == 0 {
                navigationController?.pushViewController(Sale1ViewController(), animated: true)
            } else if indexPath.row == 1 {
                navigationController?.pushViewController(Sale2ViewController(), animated: true)
            } else if indexPath.row == 2 {
                navigationController?.pushViewController(Sale3ViewController(), animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collectionViewFL {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        } else if collectionView == collectionViewSL {
            return UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        } else if collectionView == collectionViewTheirdL {
            return UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        } else if collectionView == collectionViewForthL {
            return UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        }; return UIEdgeInsets.zero
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControllFL.currentPage = Int(scrollView.contentOffset.x / (UIScreen.main.bounds.width - 20))
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension MainViewController: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
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

//var adressButton = UIButton()
//
//createButtonText(button: adressButton,
//                 text: "Pushkina streen 90'th",
//                 sizeFont: 23,
//                 colorForNormal: .darkGray,
//                 colorForHighlighted: .black)
//
//adressButton.addTarget(self, action: #selector(pressedButtonAdress), for: .touchUpInside)
//
//
//adressButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//adressButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//adressButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -15).isActive = true
//adressButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
//
//@objc func pressedButtonAdress() {
//    tabBarController?.tabBar.isHidden = true
//    navigationController?.pushViewController(MapViewController(), animated: true)
//}
