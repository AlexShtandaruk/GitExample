import UIKit

class CustomTwoCVC: UICollectionViewCell {
    
    static let reuseID = "CustomTwoCVC"
    
    var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.customRed.cgColor
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 20
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(mainImageView)
    }
    
    func setupConstraint() {
        
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        
    }
}
