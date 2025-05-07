//
//  HomeScreenViewModel.swift
//  ShopEase-Uikit
//
//  Created by Aditi Dalvi on 04/05/25.
//

import Foundation
class HomeScreenViewModel {
    var products: [ProductVM] = []
    func fetchProducts(completion: @escaping () -> Void) {
        let url = URL(string: "https://fakestoreapi.com/products")
        guard let url else {
            fatalError("The url cannot be created. Please check the api string")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            guard let data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return
            }
            guard let products = try? JSONDecoder().decode([ProductModel].self, from: data) else {
                assertionFailure("Unable to decode the data")
                return
            }
            self?.updateProduct(products: products)
            DispatchQueue.main.async {
                completion()
            }
        }).resume()
    }
    
    private func updateProduct(products: [ProductModel]) {
        // Assuming ProductVM is: ProductVM(category: String, products: [ProductData])
        var categorizedProducts: [String: [ProductData]] = [:]
        for product in products {
            let productData = ProductData(image: product.image, title: product.title, price: product.price)
            categorizedProducts[product.category, default: []].append(productData)
        }
        // Now map the dictionary into an array of ProductVM
        let productVMs: [ProductVM] = categorizedProducts.map { category, products in
            ProductVM(category: category, products: products)
        }
        self.products = productVMs.sorted(by: {
            $0.category > $1.category
        })
    }
}
