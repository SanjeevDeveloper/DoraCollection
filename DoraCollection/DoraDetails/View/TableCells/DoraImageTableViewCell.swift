//
//  DoraImageTableViewCell.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import UIKit
import Alamofire

class DoraImageTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var doraImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static var nib: UINib? {
        return UINib(nibName: String(describing: DoraImageTableViewCell.self), bundle: nil)
    }
    
    // MARK: Set Image on detail screen
    func configureImageCell(result: Result) {
        doraImageView.setImageWithUrl(result.imageURL)
    }
}
