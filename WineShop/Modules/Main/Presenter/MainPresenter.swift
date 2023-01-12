import Foundation

protocol MainViewOutput {
    func viewDidLoad()
}

class MainPresenter {
    
    weak var view: MainViewInput?
    
    private let router: MainRouter.Routes
    
    init(router: MainRouter.Routes) {
        self.router = router
    }
    
}

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        
    }
    
}
