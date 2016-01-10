//
//  recProductCell.swift
//  ParseStarterProject-Swift
//
//  Created by Ocotober Hammer on 12/24/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit



class recProductCell: UICollectionViewCell {
    var parentViewController: StaticLongMenu?
	@IBOutlet weak var tagImage: UIImageView!
	@IBOutlet weak var recProdLabel: UILabel!
	@IBOutlet weak var recProductImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
//		let cellTapped = UITapGestureRecognizer(target: self.recProductImage, action: "cellTapped")
//		let cellTapped1 = UITapGestureRecognizer(target: self.recProdLabel, action: "cellTapped")
	}
	
//	func cellTapped(recognizer: UITapGestureRecognizer) {
////		print("\(self.tag)")
////		parentViewController?.showSpecificRecGood(self.tag)
//	}
}
