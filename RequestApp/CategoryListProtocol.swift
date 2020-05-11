import Foundation
import RxSwift

protocol CategoryListInteractorProtocol: class {
    func getCategories() -> Observable<[Category]>
}

protocol CategoryListPresenterProtocol: class {
    func setData()
    var categories: BehaviorSubject<[Category]> { get }
    var isLoading: BehaviorSubject<Bool> { get }
}

protocol CategoryListViewProtocol: class {
    
}

protocol CategoryListConfiguratorProtocol: class {
    func configure(with viewController: CategoryListViewController)
}
