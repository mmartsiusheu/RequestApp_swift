import Foundation
import RxSwift

class ProductListPresenter: ProductListPresenterProtocol {
    
    private weak var view: ProductListViewProtocol!
    private let disposeBag = DisposeBag()
    
    var interactor: ProductListInteractorProtocol!
    let products: BehaviorSubject<[Product]>
    let isLoading: BehaviorSubject<Bool>
    
    init(view: ProductListViewProtocol) {
        self.view = view
        self.products = BehaviorSubject<[Product]>(value: [Product]())
        self.isLoading = BehaviorSubject<Bool>(value: false)
        
        products
            .map{$0.isEmpty}
            .bind(to: isLoading)
            .disposed(by: disposeBag)
    }
    
    func setData() {
        interactor
            .getProducts()
            .bind(to: products)
            .disposed(by: disposeBag)
    }
}
