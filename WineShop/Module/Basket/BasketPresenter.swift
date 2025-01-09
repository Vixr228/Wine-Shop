import Foundation

protocol BasketViewOutput {
    func viewDidLoad()
  //  func close()
}

class BasketPresenter {
    
    weak var view: BasketViewInput?
    
    private let router: BasketRouter.Routes
    
    init(router: BasketRouter.Routes) {
        self.router = router
    }
    
}

extension BasketPresenter: BasketViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
