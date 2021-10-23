//
//  DoraDetailsViewController.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraDetailsViewController: UIViewController {

    @IBOutlet weak var doraDetailsTableView: UITableView! {
        didSet{
            doraDetailsTableView.estimatedRowHeight = 80
            doraDetailsTableView.rowHeight = UITableView.automaticDimension
        }
    }
    private var doraDetailsViewModel: DoraDetailsViewModel
    
    required init?(coder: NSCoder, withDoraModel doraModel: Result) {
        self.doraDetailsViewModel = DoraDetailsViewModel(details: doraModel)
            super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    func setupSubviews() {
        doraDetailsTableView.registerReusableCell(DoraImageTableViewCell.self)
        doraDetailsTableView.registerReusableCell(DoraDetailsTableViewCell.self)
        doraDetailsTableView.reloadData()
    }
    
}
extension DoraDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doraDetailsViewModel.rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch doraDetailsViewModel.rows[indexPath.row] {
        case .image:
            let cell: DoraImageTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.configureImageCell(result: doraDetailsViewModel.details)
            return cell
        case .text:
            let cell: DoraDetailsTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.configureDoraDetailCell(result: doraDetailsViewModel.details)
            return cell
        }
    }
}
