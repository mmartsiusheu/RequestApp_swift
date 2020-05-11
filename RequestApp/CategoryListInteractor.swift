import Foundation
import RxSwift

class CategoryListInteractor: CategoryListInteractorProtocol {
    
    private let service: ApiServiceProtocol
    
    weak var presenter: CategoryListPresenterProtocol!
    
    init(presenter: CategoryListPresenterProtocol) {
        self.presenter = presenter
        self.service = ApiService()
    }
    
    func getCategories() -> Observable<[Category]> {
        return service.getCategories().asObservable()
    }
}
