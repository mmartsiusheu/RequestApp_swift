import UIKit
import RxSwift
import RxCocoa

class CategoryListViewController: UIViewController, CategoryListViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    
    var presenter: CategoryListPresenterProtocol!
    var configurator: CategoryListConfiguratorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private
    
    private func initialSetup() {
        configurator = CategoryListConfigurator()
        configurator.configure(with: self)
        spinner.hidesWhenStopped = true
        tableView.rowHeight = UITableView.automaticDimension
        
        presenter.categories
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "CategoryListTableViewCell", cellType: CategoryListTableViewCell.self)) { (_, model, cell) in
                cell.setup(category: model)
            }
            .disposed(by: disposeBag)
        
        presenter.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: tableView.rx.isHidden)
            .disposed(by: disposeBag)
        
        presenter.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: spinner.rx.isAnimating)
            .disposed(by: disposeBag)
        
        presenter.setData()
    }
}
