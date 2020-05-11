import UIKit

class CategoryListTableViewCell: UITableViewCell {

    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    func setup(category: Category) {
        identifierLabel.text = "Identifier: \(category.id)"
        categoryNameLabel.numberOfLines = 0
        categoryNameLabel.text = "Category Name: \(category.categoryName)"
    }
}
