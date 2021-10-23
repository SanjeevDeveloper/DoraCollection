//
//  DoraCollectionListViewController.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit
import MBProgressHUD

class DoraCollectionListViewController: UIViewController {

    var doraCollectionViewModel = DoraCollectionViewModel(aPISniperProtocol: APISniper())
    
    @IBOutlet weak var noRecordLabel: UILabel!
    @IBOutlet weak var doraCollectionTableView: UITableView! {
        didSet {
            doraCollectionTableView.estimatedRowHeight = 80
            doraCollectionTableView.rowHeight = UITableView.automaticDimension
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    // setup subviews on screen
    func setupViews() {
        self.title = Constant.doraCollectionHead
        doraCollectionTableView.registerReusableCell(DoraCollectionTableViewCell.self)
        doraCollectionViewModel.doraCollectionProtcol = self
        getDoraListFromAPI()
    }
    
    // function to load dora collection from web api
    func getDoraListFromAPI() {
        doraCollectionViewModel.getDoraCollection { [weak self] (isSuccess) in
            self?.noRecordLabel.isHidden = isSuccess
            self?.doraCollectionTableView.reloadData()
        }
    }
}

// MARK: UITableView Datasource/Delegate
extension DoraCollectionListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doraCollectionViewModel.doraCollection?.results.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DoraCollectionTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCellWithDetails(result: doraCollectionViewModel.doraCollection?.results[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let doraModel = doraCollectionViewModel.doraCollection?.results[indexPath.row] else { return }
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DoraDetailsViewController", creator: { coder in
            return DoraDetailsViewController(coder: coder, withDoraModel: doraModel)
        })
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: Loader Protocol
extension DoraCollectionListViewController: DoraCollectionLoaderHudProtocol {
    func showHudWithMessage(message: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
        hud.mode = .text
        hud.label.text = message
        hud.hide(animated: false, afterDelay: 2.0)
    }
    func showHud() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func hideHud() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
