import Foundation
import UIKit

struct TheirdLModel {
   
    var mainImageTheirdLine: UIImage
    
    static func fetchSecondLine() -> [TheirdLModel] {
        let firstItem = TheirdLModel(mainImageTheirdLine: UIImage(named: "YandexPlus")!)
        let secondItem = TheirdLModel(mainImageTheirdLine: UIImage(named: "Aviasale")!)
        
        return [firstItem, secondItem]
    }
}
