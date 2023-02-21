protocol FavoriteRoute {
    func openFavoriteModuleBuilder()
}

extension FavoriteRoute where Self: RouterProtocol {
    
    func openFavoriteModuleBuilder() {
        let controller = FavoriteModuleBuilder.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
