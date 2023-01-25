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
    
    private var pageControllFL: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = .darkGray
        return page
    }()
    
    private lazy var subView: [UIView] = [self.adressButton, self.loginButton, self.searchTextField, self.collectionViewFL, self.pageControllFL, self.collectionViewSL, self.collectionViewTheirdL, self.shopButton, self.shopButtonImage, self.collectionViewForthL]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView(subViewVC: subView)
        
        searchTextField.addTarget(self, action: #selector(pressedSearchTextField), for: .touchDown)
        
        createDelegateDataSource(collectionView: collectionViewFL)
        createDelegateDataSource(collectionView: collectionViewSL)
        createDelegateDataSource(collectionView: collectionViewTheirdL)
        createDelegateDataSource(collectionView: collectionViewForthL)
        
        createLayout(layout: layoutFL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 5)
        createLayout(layout: layoutSL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 1)
        createLayout(layout: layoutTheirdL,
                     chosenDirection: .vertical,
                     minimumLineSpacing: 1)
        createLayout(layout: layoutForthL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 1)
        
        createCollectionView(collectionView: collectionViewFL,
                             layout: layoutFL)
        createCollectionView(collectionView: collectionViewSL,
                             layout: layoutSL)
        createCollectionView(collectionView: collectionViewTheirdL,
                             layout: layoutTheirdL)
        createCollectionView(collectionView: collectionViewForthL,
                             layout: layoutForthL)
        
        createButtonText(button: adressButton,
                         text: "Pushkina streen 90'th",
                         sizeFont: 23,
                         colorForNormal: .darkGray,
                         colorForHighlighted: .black)
        adressButton.addTarget(self, action: #selector(pressedButtonAdress), for: .touchUpInside)
        createButtonText(button: shopButton,
                         text: "Shops",
                         sizeFont: 35,
                         colorForNormal: .customRed,
                         colorForHighlighted: .black)
        shopButton.addTarget(self, action: #selector(pressedButtonShop), for: .touchUpInside)
        createButtonImage(button: shopButtonImage,
                          image: imageShop!,
                          tintColor: .customRed)
        shopButtonImage.addTarget(self, action: #selector(pressedButtonShop), for: .touchUpInside)
        createButtonImage(button: loginButton,
                          image: imageLogin!,
                          tintColor: .customRed)
        loginButton.addTarget(self, action: #selector(pressedButtonLogin), for: .touchUpInside)
        
        setupConstraint()
        
        setupModel()
        
        pageContorollIndex()
    }
    
    func pageContorollIndex() {
        pageControllFL.numberOfPages = dataCVFirstLine.count / 2
    }
    
    func createDelegateDataSource(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraint() {
        
        adressButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        adressButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        adressButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        adressButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: adressButton.centerYAnchor).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: adressButton.bottomAnchor, constant: 5).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionViewFL.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        collectionViewFL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionViewFL.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionViewFL.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            cell.mainImageView.image = dataCVFirstLine[indexPath.row].mainImageFirstLine
            cell.mainImageView.backgroundColor = UIColor.customRed
            cell.mainImageView.layer.cornerRadius = 20
            cell.mainLabel.text = dataCVFirstLine[indexPath.row].nameFirstLine
            return cell
        } else if collectionView == collectionViewSL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            cell.mainImageViewSecondtype.image = dataCVSecondLine[indexPath.row].mainImageSecondLine
            cell.mainImageViewSecondtype.contentMode = .scaleAspectFill
            cell.mainImageViewSecondtype.layer.cornerRadius = 15
            return cell
        } else if collectionView == collectionViewTheirdL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            cell.mainImageViewSecondtype.image = dataCVTheirdLine[indexPath.row].mainImageTheirdLine
            cell.mainImageViewSecondtype.contentMode = .scaleAspectFit
            cell.mainImageViewSecondtype.layer.cornerRadius = 15
            return cell
        } else if collectionView == collectionViewForthL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            cell.mainImageViewSecondtype.image = dataCVForthLine[indexPath.row].mainImageForthLine
            cell.mainImageViewSecondtype.contentMode = .scaleAspectFill
            cell.mainImageViewSecondtype.layer.cornerRadius = 15
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewFL {
            let customWidth: CGFloat = collectionViewFL.frame.width/2 - 1
            let customHeight: CGFloat = collectionViewFL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewSL {
            let customWidth: CGFloat = collectionViewSL.frame.width/3 - 1
            let customHeight: CGFloat = collectionViewSL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewTheirdL {
            let customWidth: CGFloat = collectionViewTheirdL.frame.width/1 - 1
            let customHeight: CGFloat = collectionViewTheirdL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else if collectionView == collectionViewForthL {
            let customWidth: CGFloat = collectionViewForthL.frame.width/2 - 1
            let customHeight: CGFloat = collectionViewForthL.frame.height
            return CGSize(width: customWidth, height: customHeight)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControllFL.currentPage = Int(scrollView.contentOffset.x / (UIScreen.main.bounds.width - 20))
    }
    
    
}
