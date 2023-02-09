protocol BasketRoute {
    func openBasketModuleBuilder()
}

extension BasketRoute where Self: RouterProtocol {
    
    func openBasketModuleBuilder() {
        let controller = BasketModuleBuilder.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
