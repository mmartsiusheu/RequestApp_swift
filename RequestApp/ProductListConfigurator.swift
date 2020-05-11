import Foundation

class ProductListConfigurator: ProductListConfiguratorProtocol {
    
    func configure(with viewController: ProductListViewController) {
        let presenter = ProductListPresenter(view: viewController)
        let interactor = ProductListInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
