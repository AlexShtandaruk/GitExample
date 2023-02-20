import Foundation
import UIKit

struct FifthLModel {
    
    var mainImageFifthLine: UIImage
    
    static func fetchFirstLine() -> [FifthLModel] {
        
        let firstItem = FifthLModel(mainImageFifthLine: UIImage(named: "скидкамагнит")!)
        let secondItem = FifthLModel(mainImageFifthLine: UIImage(named: "скидкапятерочка")!)
        let theirdItem = FifthLModel(mainImageFifthLine: UIImage(named: "скидкаметро")!)
        let forthItem = FifthLModel(mainImageFifthLine: UIImage(named: "скидкаперекресток")!)
        let fifthItem = FifthLModel(mainImageFifthLine: UIImage(named: "скидкалента")!)
        
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem]
    }
    
}
