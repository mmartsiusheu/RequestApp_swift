import Foundation
import RxSwift

class CategoryListPresenter: CategoryListPresenterProtocol {
    
    private weak var view: CategoryListViewProtocol!
    private let disposeBag = DisposeBag()
    
    var interactor: CategoryListInteractorProtocol!
    let categories: BehaviorSubject<[Category]>
    let isLoading: BehaviorSubject<Bool>
    
    init(view: CategoryListViewProtocol) {
        self.view = view
        self.categories = BehaviorSubject<[Category]>(value: [Category]())
        self.isLoading = BehaviorSubject<Bool>(value: false)
        
        categories
            .map{$0.isEmpty}
            .bind(to: isLoading)
            .disposed(by: disposeBag)
    }
    
    func setData() {
        interactor
            .getCategories()
            .bind(to: categories)
            .disposed(by: disposeBag)
    }
}
