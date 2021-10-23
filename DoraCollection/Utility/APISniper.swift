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
    // get data from API
    func getDoraListingFromServer(completion: @escaping ((_ status: Bool, _ data: DoraCollectionModel?, _ error: Error?) -> Void)) {
        let request = AF.request(WebAPI.doraAPI)
        request.responseDecodable(of: DoraCollectionModel.self) { (response) in
            switch response.result {
                case .success(let doraCollection):
                    completion(true, doraCollection, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
        }
        
    }
}
