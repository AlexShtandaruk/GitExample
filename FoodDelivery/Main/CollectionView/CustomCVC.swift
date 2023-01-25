import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CustomCollectionViewCell"
    
    var mainImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        image.clipsToBounds = true
        return image
    }()
    
    var mainImageViewSecondtype: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        image.clipsToBounds = true
        return image
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Doloman Pavljenko Light", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
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
        contentView.addSubview(mainImageViewSecondtype)
        contentView.addSubview(mainImageView)
        contentView.addSubview(mainLabel)
    }
    
    func setupConstraint() {
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
        mainLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor,constant: 10).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor).isActive = true
        
        mainImageViewSecondtype.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageViewSecondtype.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageViewSecondtype.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageViewSecondtype.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
