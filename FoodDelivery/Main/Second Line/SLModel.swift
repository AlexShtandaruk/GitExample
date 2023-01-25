import Foundation
import UIKit

struct SLModel {
   
    var mainImageSecondLine: UIImage
    
    static func fetchSecondLine() -> [SLModel] {
        let firstItem = SLModel(mainImageSecondLine: UIImage(named: "saleBurger")!)
        let secondItem = SLModel(mainImageSecondLine: UIImage(named: "saleSushi")!)
        let theirdItem = SLModel(mainImageSecondLine: UIImage(named: "salePizza")!)
        let forthItem = SLModel(mainImageSecondLine: UIImage(named: "sale30")!)

        return [firstItem, secondItem, theirdItem, forthItem]
    }
}
