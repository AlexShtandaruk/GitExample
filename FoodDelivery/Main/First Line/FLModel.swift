import Foundation
import UIKit

struct FLModel {
    
    var mainImageFirstLine: UIImage
    var nameFirstLine: String
    
    static func fetchFirstLine() -> [FLModel] {
        let firstItem = FLModel(mainImageFirstLine: UIImage(named: "pizza")!, nameFirstLine: "Pizza")
        let secondItem = FLModel(mainImageFirstLine: UIImage(named: "burger")!, nameFirstLine: "Burger")
        let theirdItem = FLModel(mainImageFirstLine: UIImage(named: "wine")!, nameFirstLine: "Wine")
        let forthItem = FLModel(mainImageFirstLine: UIImage(named: "breakfast")!, nameFirstLine: "Breakfast")
        let fifthItem = FLModel(mainImageFirstLine: UIImage(named: "pork")!, nameFirstLine: "Pork")
        let sixthItem = FLModel(mainImageFirstLine: UIImage(named: "beef")!, nameFirstLine: "Beef")
    
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem, sixthItem]
    }
}
