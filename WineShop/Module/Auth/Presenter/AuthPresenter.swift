import UIKit

protocol AuthViewOutput {
    func viewDidLoad()
//    func close()
}

class AuthPresenter {
    
    weak var view: AuthViewInput?
    
    private let router: AuthRouter.Routes
    
    init(router: AuthRouter.Routes) {
        self.router = router
    }
    
}

extension AuthPresenter: AuthViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
