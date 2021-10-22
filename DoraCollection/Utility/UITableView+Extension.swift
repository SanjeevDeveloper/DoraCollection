//
//  UITableView+Extension.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import Foundation
import UIKit

protocol Reusable: class {
  static var reuseIdentifier: String { get }
  static var nib: UINib? { get }
}

extension Reusable {
  static var reuseIdentifier: String { return NSStringFromClass(self) }
  static var nib: UINib? { return nil }
}

extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
    if let nib = T.nib {
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    } else {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
  }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
  }
}
