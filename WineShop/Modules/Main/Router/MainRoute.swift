protocol MainRoute {
    func openMain()
}

extension MainRoute where Self: RouterProtocol {
    func openMain() {
        let controller = MainModuleBuilder.build()
        viewController.navigationController?.setViewControllers([controller], animated: true)
    }
}
