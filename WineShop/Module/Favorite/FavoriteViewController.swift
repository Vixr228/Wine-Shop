import UIKit

protocol FavoriteViewInput: AnyObject {
    
}

class FavoriteViewController: BaseViewController<FavoriteView> {
    
    var output: FavoriteViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
}

extension FavoriteViewController: FavoriteViewInput {
    
}
