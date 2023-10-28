//
//  ViewCryptoControllerViewModel.swift
//  crypto-mvvm
//
//  Created by Dwiki Dwiki on 25/10/23.
//

import Foundation
import UIKit

class ViewCryptoControllerViewModel {
    
    var onImageLoaded: ((UIImage?) -> Void)?
    
    let coin: Coin
    
    init(_ coin: Coin) {
        self.coin = coin
        self.loadImage()
    }
    
    private func loadImage() {
        DispatchQueue.global().async { [weak self] in
            if let logoURL = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
            
        }
    }
    
    //MARK: - computed properties
    
    var rankLabel: String {
        return "Rank: \(self.coin.rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.pricingData.USD.marketCap) USD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: $\(self.coin.pricingData.USD.marketCap) USD"
    }
    
    var maxSupplyLabel: String {
        if let maxSupply = self.coin.maxSupply {
            return "Max Supply: \(maxSupply)"
        } else {
            return "123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n"
        }
        
    }
}
