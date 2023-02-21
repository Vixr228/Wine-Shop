protocol ProfileRoute {
    func openProfileModuleBuilder()
}

extension ProfileRoute where Self: RouterProtocol {
    
    func openProfileModuleBuilder() {
        let controller = ProfileModuleBuilder.build()
        viewController.navigationController?.setViewControllers([controller], animated: true) // need to change
    }
}
