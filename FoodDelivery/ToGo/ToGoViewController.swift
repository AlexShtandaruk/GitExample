import UIKit

class ToGoViewController: TypeFirstViewController {
    
    var pageControllFL = UIPageControl()
    var dataCVFirstLine = [FLModel]()
    private var layoutFL = UICollectionViewFlowLayout()
    private var collectionViewFL = UICollectionView(frame: .zero,
                                                    collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var subView: [UIView] = [self.buttonMenu,
                                          self.loginButton,
                                          self.searchButton,
                                          self.searchTextField,
                                          self.collectionViewFL,
                                          self.pageControllFL]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createPageController(page: pageControllFL)
        createDelegateDataSource(collectionView: collectionViewFL)
        createLayout(layout: layoutFL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 1)
        createCollectionView(collectionView: collectionViewFL,
                             layout: layoutFL)
        collectionViewFL.register(CustomCVC.self, forCellWithReuseIdentifier: CustomCVC.reuseID)
        createButtonImage(button: buttonMenu,
                          image: imageMenu!,
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
        pageControllFL.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
        searchTextField.addTarget(self, action: #selector(pressedSearchTextField), for: .touchDown)
        buttonMenu.addTarget(self, action: #selector(tappedButtonMenu), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(pressedButtonLogin), for: .touchUpInside)
        
    }
    
    func pageContorollIndex() {
        pageControllFL.numberOfPages = dataCVFirstLine.count / 3
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
        
        collectionViewFL.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        collectionViewFL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionViewFL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionViewFL.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        pageControllFL.topAnchor.constraint(equalTo: collectionViewFL.bottomAnchor).isActive = true
        pageControllFL.centerXAnchor.constraint(equalTo: collectionViewFL.centerXAnchor).isActive = true
    }
    
    func setupModel() {
        self.dataCVFirstLine = FLModel.fetchFirstLine()
    }
    
    @objc func pageDidChange() {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControllFL.currentPage)
        collectionViewFL.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    @objc func tappedButtonMenu() {
        let modalViewCont = ModalAnimationVC()
        modalViewCont.modalPresentationStyle = .custom
        modalViewCont.transitioningDelegate = self
        present(modalViewCont, animated: true )
    }
}

extension ToGoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewFL {
            return dataCVFirstLine.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVC.reuseID, for: indexPath) as! CustomCVC
            cell.mainImageView.image = dataCVFirstLine[indexPath.row].mainImageFirstLine
            cell.mainImageView.backgroundColor = UIColor.customRed
            cell.mainImageView.layer.cornerRadius = 20
            cell.mainLabel.text = dataCVFirstLine[indexPath.row].nameFirstLine
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewFL {
            let customWidth: CGFloat = collectionViewFL.frame.width/3 - 1
            let customHeight: CGFloat = collectionViewFL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}

extension ToGoViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControllFL.currentPage = Int(scrollView.contentOffset.x / (UIScreen.main.bounds.width - 10))
    }
}


extension ToGoViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}

extension ToGoViewController: UIViewControllerAnimatedTransitioning {
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
