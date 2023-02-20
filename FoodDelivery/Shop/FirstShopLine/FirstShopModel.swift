import Foundation
import UIKit

struct FirstShopModel {
    
    var mainImageFifthLine: UIImage
    
    static func fetchFirstLine() -> [FirstShopModel] {
        
        let firstItem = FirstShopModel(mainImageFifthLine: UIImage(named: "скидкамагнит")!)
        let secondItem = FirstShopModel(mainImageFifthLine: UIImage(named: "скидкапятерочка")!)
        let theirdItem = FirstShopModel(mainImageFifthLine: UIImage(named: "скидкаметро")!)
        let forthItem = FirstShopModel(mainImageFifthLine: UIImage(named: "скидкаперекресток")!)
        let fifthItem = FirstShopModel(mainImageFifthLine: UIImage(named: "скидкалента")!)
        
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem]
    }
    
}
