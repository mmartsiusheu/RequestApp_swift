import Foundation

class Product: Decodable {
    let id: Int
    let productName: String
    let productPrice: Int
    let vendorCode: String
    let categoryId: Int
}
