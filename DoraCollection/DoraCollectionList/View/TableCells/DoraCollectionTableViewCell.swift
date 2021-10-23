//
//  DoraCollectionTableViewCell.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit

class DoraCollectionTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var doraNameLabel: UILabel!
    @IBOutlet weak var doraImageView: UIImageView!
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: DoraCollectionTableViewCell.self), bundle: nil)
      }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Set values inside UI elements
    func configureCellWithDetails(result: Result?) {
        doraImageView.setImageWithUrl(result?.imageURL ?? "")
        doraNameLabel.text = result?.title
        episodeLabel.text = String(result?.episodes ?? 0)
        typeLabel.text = result?.type.rawValue
        scoreLabel.text = String(result?.score ?? 0)
        containerView.layer.cornerRadius = 4
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowColor = UIColor.black.cgColor
    }
}
