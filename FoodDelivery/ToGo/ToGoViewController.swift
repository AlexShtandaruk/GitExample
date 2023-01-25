import UIKit

class ToGoViewController: TypeFirstViewController {
    
    var dataCVFirstLine = [FLModel]()
    
    private var layoutFL = UICollectionViewFlowLayout()
    
    private var collectionViewFL = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var pageControllFL: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = .darkGray
        return page
    }()

    private lazy var subView: [UIView] = [self.adressButton, self.loginButton, self.searchTextField, self.collectionViewFL, self.pageControllFL]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView(subViewVC: subView)
        
        searchTextField.addTarget(self, action: #selector(pressedSearchTextField), for: .touchDown)
        createDelegateDataSource(collectionView: collectionViewFL)
        createLayout(layout: layoutFL,
                     chosenDirection: .horizontal,
                     minimumLineSpacing: 1)
        createCollectionView(collectionView: collectionViewFL,
                             layout: layoutFL)
        createButtonText(button: adressButton,
                         text: "Pushkina streen 90'th",
                         sizeFont: 23,
                         colorForNormal: .darkGray,
                         colorForHighlighted: .black)
        adressButton.addTarget(self, action: #selector(pressedButtonAdress), for: .touchUpInside)
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
    }
    
    func setupModel() {
        self.dataCVFirstLine = FLModel.fetchFirstLine()
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            cell.mainImageView.image = dataCVFirstLine[indexPath.row].mainImageFirstLine
            cell.mainImageView.backgroundColor = UIColor.customRed
            cell.mainImageView.layer.cornerRadius = 20
            cell.mainLabel.text = dataCVFirstLine[indexPath.row].nameFirstLine
            return cell
        }else {
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
