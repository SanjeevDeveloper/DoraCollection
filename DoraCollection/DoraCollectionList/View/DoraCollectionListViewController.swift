//
//  DoraCollectionListViewController.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraCollectionListViewController: UIViewController {

    var doraCollectionViewModel = DoraCollectionViewModel(aPISniperProtocol: APISniper())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doraCollectionViewModel.doraCollectionProtcol = self
    }
}

extension DoraCollectionListViewController: DoraCollectionViewModelProtocol {
    func showHud() {
    }
    
    func hideHud() {
    }
}
