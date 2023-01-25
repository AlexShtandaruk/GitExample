import Foundation
import UIKit

struct FifthLModel {
    
    var mainImageFifthLine: UIImage
    var nameFifthLine: String
    
    static func fetchFirstLine() -> [FifthLModel] {
        let firstItem = FifthLModel(mainImageFifthLine: UIImage(named: "вкусвилл")!, nameFifthLine: "Pizza")
        let secondItem = FifthLModel(mainImageFifthLine: UIImage(named: "пятерочка")!, nameFifthLine: "Burger")
        let theirdItem = FifthLModel(mainImageFifthLine: UIImage(named: "метро")!, nameFifthLine: "Wine")
        let forthItem = FifthLModel(mainImageFifthLine: UIImage(named: "магнит")!, nameFifthLine: "Breakfast")
        let fifthItem = FifthLModel(mainImageFifthLine: UIImage(named: "жизньмарт")!, nameFifthLine: "Pork")
        
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem]
    }
}
