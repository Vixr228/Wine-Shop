import UIKit

protocol BasketViewInput: AnyObject {
    
}

class BasketViewController: BaseViewController<BasketView> {
    
    var output: BasketViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
}

extension BasketViewController: BasketViewInput {
    
}
