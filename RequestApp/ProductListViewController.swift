import UIKit
import RxSwift
import RxCocoa

class ProductListViewController: UIViewController, ProductListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    
    var presenter: ProductListPresenterProtocol!
    var configurator: ProductListConfiguratorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Private
    
    private func initialSetup() {
        configurator = ProductListConfigurator()
        configurator.configure(with: self)
        spinner.hidesWhenStopped = true
        tableView.rowHeight = UITableView.automaticDimension
        
        presenter.products
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "ProductListTableViewCell", cellType: ProductListTableViewCell.self)) { (_, model, cell) in
                cell.setup(product: model)
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

