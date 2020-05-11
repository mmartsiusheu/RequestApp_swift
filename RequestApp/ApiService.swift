import Foundation
import RxSwift
import Alamofire

protocol ApiServiceProtocol: class {
    func getProducts() -> Single<[Product]>
    func getCategories() -> Single<[Category]>
}

private let apiBaseUrl = "BaseUrl"

class ApiService: ApiServiceProtocol {
    
    private let baseUrl: URL
    
    init() {
        let info = Bundle.main.infoDictionary!
        baseUrl = URL(string: info[apiBaseUrl] as! String)!
    }
    
    func getProducts() -> Single<[Product]> {
        let url = baseUrl.appendingPathComponent("/products")
        let single: Single<[Product]> = getData(url: url)
            .catchErrorJustReturn([Product]())
        return single
    }
    
    func getCategories() -> Single<[Category]> {
        let url = baseUrl.appendingPathComponent("/categories")
        let single: Single<[Category]> = getData(url: url)
            .catchErrorJustReturn([Category]())
        return single
    }
    
    // MARK: - Private
    
    private func getData<T: Decodable>(url: URL) -> Single<T> {
        return Single<T>.create { single in
            let request = AF.request(url).responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    let decoder = JSONDecoder()
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                        let data: T = try? decoder.decode(T.self, from: jsonData) else {
                            return
                    }
                    single(.success(data))
                case .failure(let error):
                    print(error)
                }
            })
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
