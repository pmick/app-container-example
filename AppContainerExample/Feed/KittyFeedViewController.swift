import UIKit

final class KittyFeedViewController: UIViewController, UICollectionViewDataSource {
    lazy var layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.dataSource = self
        view.register(KittenCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    private let loadKittenQueue = OperationQueue()
    private var cellEdgeLength: CGFloat { return view.bounds.width - 48 }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        title = NSLocalizedString("Feed", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout.itemSize = CGSize(width: cellEdgeLength, height: cellEdgeLength)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! KittenCell
        let imageWidth = Int((cellEdgeLength) * UIScreen.main.scale)
        let operation = LoadKittenOperation(cell: cell, width: imageWidth)
        loadKittenQueue.addOperation(operation)
        return cell
    }
}
