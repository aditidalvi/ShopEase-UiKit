//
//  ProductViewCellCollectionViewCell.swift
//  ShopEase-Uikit
//
//  Created by Aditi Dalvi on 04/05/25.
//

import UIKit

class ProductViewCell: UITableViewCell {
    let productImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        priceLabel.font = UIFont(name: "SF Pro", size: 14)
        priceLabel.textColor = .systemGreen
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func layoutViews() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5)
        ])
    }
    
    func configure(with product: ProductData) {
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        loadImage(from: product.image)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            productImageView.image = nil
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    self?.productImageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
}
