import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppearence()
        selectedIndex = 0
        
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func generateTabBar(){
        viewControllers = [
            UINavigationController(rootViewController:
                                    generateVC(
                                        viewController: MainViewController(),
                                        title:  "Main",
                                        image: UIImage(systemName: "homekit", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)))),
            UINavigationController(rootViewController:
                                    generateVC(
                                        viewController: RestaurantViewController(),
                                        title:  "Restaurant",
                                        image: UIImage(systemName: "fork.knife", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)))),
            UINavigationController(rootViewController:
                                    generateVC(
                                        viewController: ShopViewController(),
                                        title:  "Shop",
                                        image: UIImage(systemName: "seal", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)))),
            UINavigationController(rootViewController:
                                    generateVC(
                                        viewController: ToGoViewController(),
                                        title:  "To go",
                                        image: UIImage(systemName: "car", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)))),
            UINavigationController(rootViewController:
                                    generateVC(
                                        viewController: BasketViewController(),
                                        title:  "Basket",
                                        image: UIImage(systemName: "cube.box", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))))
            
        ]
    }
    
    func setTabBarAppearence() {
        tabBar.itemPositioning = .centered
//        tabBar.contentMode = .scaleToFill
        tabBar.backgroundColor = UIColor.customRed
        tabBar.tintColor = .black
        tabBar.itemWidth = 90
        tabBar.sizeToFit()
        tabBar.unselectedItemTintColor = .lightGray
    }
}
