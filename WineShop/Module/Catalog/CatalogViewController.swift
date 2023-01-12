import UIKit

protocol CatalogViewInput: AnyObject {
    
}

class CatalogViewController: BaseViewController<CatalogView> {
    
    var output: CatalogViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
}

extension CatalogViewController: CatalogViewInput {
    
}
