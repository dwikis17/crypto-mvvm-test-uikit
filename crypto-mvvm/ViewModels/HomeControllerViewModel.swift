//
//  HomeControllerViewModel.swift
//  crypto-mvvm
//
//  Created by Dwiki Dwiki on 25/10/23.
//

import Foundation


class HomeControllerViewModel {
    
    var onCoinsUpdated: (() -> Void)?
    var onError: ((CoinServiceError) -> Void)?
    
    private(set) var coins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
    }
    
    public func fetchCoins() {
        let endPoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endPoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                
            case .failure(let error):
                print("errorrr")
                self?.onError?(error)
            }
        }
    }
}
