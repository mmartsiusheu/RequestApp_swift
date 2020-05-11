import Foundation
import RxSwift

class ProductListInteractor: ProductListInteractorProtocol {
    
    private let service: ApiServiceProtocol
    
    weak var presenter: ProductListPresenterProtocol!
    
    init(presenter: ProductListPresenterProtocol) {
        self.presenter = presenter
        self.service = ApiService()
    }
    
    func getProducts() -> Observable<[Product]> {
        return service.getProducts().asObservable()
    }
}
