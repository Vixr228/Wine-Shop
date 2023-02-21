import Foundation

protocol ProfileViewOutput {
    func viewDidLoad()
//    func close()
}

class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    
    private let router: ProfileRouter.Routes
    
    init(router: ProfileRouter.Routes) {
        self.router = router
    }
    
}

extension ProfilePresenter: ProfileViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
