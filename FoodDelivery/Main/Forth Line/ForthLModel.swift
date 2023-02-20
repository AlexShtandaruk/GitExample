import Foundation
import UIKit

struct ForthLModel {
   
    var mainImageForthLine: UIImage
    
    static func fetchSecondLine() -> [ForthLModel] {
        let firstItem = ForthLModel(mainImageForthLine: UIImage(named: "store")!)
        let secondItem = ForthLModel(mainImageForthLine: UIImage(named: "store")!)
        let theirdItem = ForthLModel(mainImageForthLine: UIImage(named: "store")!)
        let forthItem = ForthLModel(mainImageForthLine: UIImage(named: "store")!)
        let fifthItem = ForthLModel(mainImageForthLine: UIImage(named: "store")!)
        
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem]
    }
}
