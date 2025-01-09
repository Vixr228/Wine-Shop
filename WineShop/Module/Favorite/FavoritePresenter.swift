import Foundation

protocol FavoriteViewOutput {
    func viewDidLoad()
//    func close()
}

class FavoritePresenter {
    
    weak var view: FavoriteViewInput?
    
    private let router: FavoriteRouter.Routes
    
    init(router: FavoriteRouter.Routes) {
        self.router = router
    }
    
}

extension FavoritePresenter: FavoriteViewOutput {
    
    func viewDidLoad() {
        
    }
    
//    func close() {
//        router.close()
//    }
    
}
