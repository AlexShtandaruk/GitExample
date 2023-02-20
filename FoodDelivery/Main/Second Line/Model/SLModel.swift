import Foundation
import UIKit

struct SLModel {
   
    var mainImageSecondLine: UIImage
    
    static func fetchSecondLine() -> [SLModel] {
        let firstItem = SLModel(mainImageSecondLine: UIImage(named: "percent")!)
        let secondItem = SLModel(mainImageSecondLine: UIImage(named: "percent")!)
        let theirdItem = SLModel(mainImageSecondLine: UIImage(named: "percent")!)
        let forthItem = SLModel(mainImageSecondLine: UIImage(named: "percent")!)

        return [firstItem, secondItem, theirdItem, forthItem]
    }
}
