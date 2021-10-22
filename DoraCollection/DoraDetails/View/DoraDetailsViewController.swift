//
//  DoraDetailsViewController.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        tableView.register(UINib(nibName: "DoraImageTableViewCell", bundle: nil), forCellReuseIdentifier: "DoraImageTableViewCell")
    }
}
extension DoraDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoraImageTableViewCell", for: indexPath) as! DoraImageTableViewCell
        return cell
    }
}
