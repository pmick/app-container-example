import UIKit

final class ProfileViewController: UIViewController {
    private let logoutHandler: () -> Void
    
    init(logoutHandler: @escaping () -> Void) {
        self.logoutHandler = logoutHandler
        super.init(nibName: nil, bundle: nil)
        title = NSLocalizedString("Profile", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle(NSLocalizedString("Logout", comment: ""), for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    private func logoutButtonTapped() {
        logoutHandler()
    }
}
