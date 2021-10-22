//
//  DoraCollectionViewModel.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import Foundation

protocol DoraCollectionViewModelProtocol {
    func showHud()
    func hideHud()
}

class DoraCollectionViewModel {
    var doraCollection: DoraCollectionModel!
    
    var aPISniperProtocol: APISniperProtocol
    
    var doraCollectionProtcol: DoraCollectionViewModelProtocol?
    
    init(aPISniperProtocol: APISniperProtocol) {
        self.aPISniperProtocol = aPISniperProtocol
    }
    
    func getDoraCollection() {
        doraCollectionProtcol?.showHud()
        self.aPISniperProtocol.getDoraListingFromServer { [weak self] (isSuccess, data, error) in
            self?.doraCollectionProtcol?.hideHud()
            if isSuccess {
                
            } else {
                
            }
        }
    }
}
