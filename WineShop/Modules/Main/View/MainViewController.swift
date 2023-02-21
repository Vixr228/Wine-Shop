import UIKit

protocol MainViewInput: AnyObject {
    
}

class MainViewController: BaseViewController<MainView> {
    
    var output: MainViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
}

extension MainViewController: MainViewInput {
    
}
