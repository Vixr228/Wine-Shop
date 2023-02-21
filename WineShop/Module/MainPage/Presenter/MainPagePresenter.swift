import Foundation

protocol MainPageViewOutput {
    func viewDidLoad()
   // func close()
}

class MainPagePresenter {
    
    weak var view: MainPageViewInput?
    
    private let router: MainPageRouter.Routes
    
    init(router: MainPageRouter.Routes) {
        self.router = router
    }
    
}

extension MainPagePresenter: MainPageViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
