//
//  DoraDetailsViewModel.swift
//  DoraCollection
//
//  Created by Sanjeev on 22/10/21.
//

import Foundation

class DoraDetailsViewModel {
    var rows: [DetailType] = [.image, .text]
    var details: Result
    
    init(details: Result) {
        self.details = details
    }
}
