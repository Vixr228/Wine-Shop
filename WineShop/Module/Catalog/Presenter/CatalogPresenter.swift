import Foundation

protocol CatalogViewOutput {
    func viewDidLoad()
    //func close()
}

class CatalogPresenter {
    
    weak var view: CatalogViewInput?
    
    private let router: CatalogRouter.Routes
    
    init(router: CatalogRouter.Routes) {
        self.router = router
    }
    
}

extension CatalogPresenter: CatalogViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
