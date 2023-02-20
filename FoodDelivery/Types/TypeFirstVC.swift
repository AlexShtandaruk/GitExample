import UIKit

class TypeFirstViewController: UIViewController, UITextFieldDelegate {
    
    var adressButton = UIButton()
    var loginButton = UIButton()
    
    let imageLogin = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    
    
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
        textField.layer.borderWidth = 3
        textField.delegate = self
        textField.tag = 1
        textField.returnKeyType = .next
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
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseID)
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
                          colorForHighlighted: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.setTitleColor(colorForNormal, for: .normal)
        button.setTitleColor(colorForHighlighted, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Doloman Pavljenko Light", size: sizeFont)
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
    
    @objc func pressedButtonAdress() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(MapViewController(), animated: true)
    }
    
    
}

