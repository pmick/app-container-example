import Foundation
import os.log
import UIKit

final class LoadKittenOperation: Operation {
    override var isAsynchronous: Bool { return true }
    
    var _isFinished: Bool = false
    
    override var isFinished: Bool {
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
        
        get {
            return _isFinished
        }
    }
    
    var _isExecuting: Bool = false
    
    override var isExecuting: Bool {
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
        
        get {
            return _isExecuting
        }
    }
    
    private let cell: KittenCell
    private let width: Int
    
    init(cell: KittenCell, width: Int) {
        self.cell = cell
        self.width = width
    }
    
    override func start() {
        super.start()
        
        isExecuting = true
        
        do {
            let data = try Data(contentsOf: URL(string: "https://placekitten.com/\(width)/\(width)")!)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                guard !self.isCancelled else { return }
                
                UIView.transition(with: self.cell.kittenImageView, duration: 0.2, options: .transitionCrossDissolve, animations: {
                    self.cell.kittenImageView.image = image
                }, completion: nil)
                
                self.isExecuting = false
                self.isFinished = true
            }
        } catch {
            os_log("Error loading kitten %@", error.localizedDescription)
            isExecuting = false
            isFinished = true
        }
    }
}
