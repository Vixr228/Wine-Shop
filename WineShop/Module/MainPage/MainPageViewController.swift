import UIKit

protocol MainPageViewInput: AnyObject {
    
}

class MainPageViewController: BaseViewController<MainPageView> {
    
    var output: MainPageViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
}

extension MainPageViewController: MainPageViewInput {
    
}
