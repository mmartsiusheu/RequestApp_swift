import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var vendorCodeLabel: UILabel!
    @IBOutlet weak var categoryIdLabel: UILabel!
    
    func setup(product: Product) {
        identifierLabel.text = "Identifier: \(product.id)"
        productNameLabel.text = "Product Name: \(product.productName)"
        priceLabel.text = "Price: \(product.productPrice)"
        vendorCodeLabel.text = "Vendor Code: \(product.vendorCode)"
        categoryIdLabel.text = "Category ID: \(product.categoryId)"
    }
}
