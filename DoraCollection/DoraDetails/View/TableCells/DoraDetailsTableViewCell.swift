//
//  DoraDetailsTableViewCell.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var doraTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Set data in detail cell
    func configureDoraDetailCell(result: Result) {
        doraTitleLabel.text = result.title
        detailLabel.text = result.synopsis
        episodeLabel.text = String(result.episodes)
        typeLabel.text = result.type.rawValue
        scoreLabel.text = String(result.score)
    }
}
