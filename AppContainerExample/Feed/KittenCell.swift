import UIKit

final class KittenCell: UICollectionViewCell {
    lazy var kittenImageView = UIImageView()
    var loadKittenOperation: LoadKittenOperation?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(kittenImageView)
        kittenImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kittenImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            kittenImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: kittenImageView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: kittenImageView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        loadKittenOperation?.cancel()
        kittenImageView.layer.removeAllAnimations()
        kittenImageView.image = nil
    }
}
