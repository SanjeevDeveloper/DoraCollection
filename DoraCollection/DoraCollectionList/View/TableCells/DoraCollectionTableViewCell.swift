//
//  DoraCollectionTableViewCell.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var doraNameLabel: UILabel!
    @IBOutlet weak var doraImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Set values inside UI elements
    func configureCellWithDetails(result: Result) {
        doraNameLabel.text = result.title
        episodeLabel.text = String(result.episodes)
        typeLabel.text = result.type.rawValue
        scoreLabel.text = String(result.score)
    }
}
