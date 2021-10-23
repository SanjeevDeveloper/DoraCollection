//
//  DoraCollectionViewModel.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import Foundation

protocol DoraCollectionLoaderHudProtocol {
    func showHud()
    func showHudWithMessage(message: String)
    func hideHud()
}

protocol DoraCollectionProtocol {
    func getDoraCollection(completionHandler: @escaping ((Bool) -> Void))
}
class DoraCollectionViewModel: DoraCollectionProtocol {
    var doraCollection: DoraCollectionModel?
    
    var aPISniperProtocol: APISniperProtocol
    
    var doraCollectionProtcol: DoraCollectionLoaderHudProtocol?
    
    init(aPISniperProtocol: APISniperProtocol) {
        self.aPISniperProtocol = aPISniperProtocol
    }
    
    // MARK: Get collection from API
    func getDoraCollection(completionHandler: @escaping ((Bool) -> Void)) {
        if Reachability.isConnectedToNetwork() {
            doraCollectionProtcol?.showHud()
            self.aPISniperProtocol.getDoraListingFromServer { [weak self] (isSuccess, data, error) in
                self?.doraCollectionProtcol?.hideHud()
                if isSuccess, let childData = data {
                    self?.doraCollection = childData
                } else {
                    self?.doraCollection = nil
                    self?.doraCollectionProtcol?.showHudWithMessage(message: Constant.errorMessage)
                }
                completionHandler(isSuccess)
            }
        } else {
            doraCollectionProtcol?.showHudWithMessage(message: Constant.noInternetConnection)
        }
    }
}
