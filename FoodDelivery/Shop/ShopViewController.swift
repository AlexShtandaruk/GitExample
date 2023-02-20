import UIKit

class ShopViewController: TypeFirstViewController {
    
    var dataCVFirstLine = [FifthLModel]()
    
    private var layoutFL = UICollectionViewFlowLayout()
    
    private var collectionViewFL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var pageControllFL = UIPageControl()
    
    private lazy var subView: [UIView] = [self.adressButton,
                                          self.loginButton,
                                          self.searchTextField,
                                          self.collectionViewFL,
                                          self.pageControllFL]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView(subViewVC: subView)
        
        createDelegateDataSource(collectionView: collectionViewFL)
        
        createLayout(layout: layoutFL, chosenDirection: .horizontal, minimumLineSpacing: 1)
        
        createCollectionView(collectionView: collectionViewFL, layout: layoutFL)
        collectionViewFL.register(CustomTwoCVC.self, forCellWithReuseIdentifier: CustomTwoCVC.reuseID)
        
        createPageController(page: pageControllFL)
        pageControllFL.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)

        createButtonImage(button: searchButton,
                          image: imageSearch!,
                          tintColor: .black)
        createButtonText(button: adressButton,
                         text: "Pushkina streen 90'th",
                         sizeFont: 23,
                         colorForNormal: .darkGray,
                         colorForHighlighted: .black)
        createButtonImage(button: loginButton,
                          image: imageLogin!,
                          tintColor: .customRed)
        
        searchTextField.addTarget(self, action: #selector(pressedSearchTextField), for: .touchDown)
        adressButton.addTarget(self, action: #selector(pressedButtonAdress), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(pressedButtonLogin), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(pressedSearchTextField), for: .touchUpInside)
        
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
        collectionViewFL.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        pageControllFL.topAnchor.constraint(equalTo: collectionViewFL.bottomAnchor).isActive = true
        pageControllFL.centerXAnchor.constraint(equalTo: collectionViewFL.centerXAnchor).isActive = true
        
    }
    
    func setupModel() {
        self.dataCVFirstLine = FifthLModel.fetchFirstLine()
    }
    
    @objc func pageDidChange() {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControllFL.currentPage) / 1.5
        collectionViewFL.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
}

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFL {
            return dataCVFirstLine.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFL {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTwoCVC.reuseID, for: indexPath) as! CustomTwoCVC
            cell.mainImageView.image = dataCVFirstLine[indexPath.row].mainImageFifthLine
            cell.mainImageView.backgroundColor = .customLightGrey
            cell.mainImageView.layer.cornerRadius = 20
            cell.mainImageView.contentMode = .scaleAspectFit
            cell.mainImageView.layer.borderColor = UIColor.customRed.cgColor
            cell.mainImageView.layer.borderWidth = 3
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

extension ShopViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControllFL.currentPage = Int(scrollView.contentOffset.x / (UIScreen.main.bounds.width - 2))
    }
    
    
}
