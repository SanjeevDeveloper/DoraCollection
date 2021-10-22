//
//  APISniper.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import Foundation
import Alamofire

protocol APISniperProtocol {
    func getDoraListingFromServer(completion: @escaping ((_ status: Bool, _ data: DoraCollectionModel?, _ error: Error?) -> Void))
}
struct APISniper: APISniperProtocol {
    func getDoraListingFromServer(completion: @escaping ((_ status: Bool, _ data: DoraCollectionModel?, _ error: Error?) -> Void)) {
        completion(true, nil, nil)
    }
}
