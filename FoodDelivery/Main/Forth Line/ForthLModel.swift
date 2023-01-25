import Foundation
import UIKit

struct ForthLModel {
   
    var mainImageForthLine: UIImage
    
    static func fetchSecondLine() -> [ForthLModel] {
        let firstItem = ForthLModel(mainImageForthLine: UIImage(named: "магнит")!)
        let secondItem = ForthLModel(mainImageForthLine: UIImage(named: "пятерочка")!)
        let theirdItem = ForthLModel(mainImageForthLine: UIImage(named: "метро")!)
        let forthItem = ForthLModel(mainImageForthLine: UIImage(named: "вкусвилл")!)
        let fifthItem = ForthLModel(mainImageForthLine: UIImage(named: "жизньмарт")!)
        
        return [firstItem, secondItem, theirdItem, forthItem, fifthItem]
    }
}
