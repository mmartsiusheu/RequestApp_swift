import Foundation

class CategoryListConfigurator: CategoryListConfiguratorProtocol {
    
    func configure(with viewController: CategoryListViewController) {
        let presenter = CategoryListPresenter(view: viewController)
        let interactor = CategoryListInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
