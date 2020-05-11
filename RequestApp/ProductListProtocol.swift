import Foundation
import RxSwift

protocol ProductListInteractorProtocol: class {
    func getProducts() -> Observable<[Product]>
}

protocol ProductListPresenterProtocol: class {
    func setData()
    var products: BehaviorSubject<[Product]> { get }
    var isLoading: BehaviorSubject<Bool> { get }
}

protocol ProductListViewProtocol: class {
    
}

protocol ProductListConfiguratorProtocol: class {
    func configure(with viewController: ProductListViewController)
}
