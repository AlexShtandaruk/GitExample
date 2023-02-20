import UIKit

class TypeSecondViewController: UIViewController {

    var buttonBack = UIButton()
    
    let imageBack = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
    
    var labelTitle = UILabel()
    
    var labelBody = UILabel()
    
    
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
    
    
    
    
}

