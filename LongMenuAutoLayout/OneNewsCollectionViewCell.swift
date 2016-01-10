//
//  OneNewsCollectionViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Ocotober Hammer on 12/9/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class OneNewsCollectionViewCell: UICollectionViewCell {
	
	var parentViewController: StaticLongMenu?
	

	@IBOutlet weak var newsHeader: UILabel!
	@IBOutlet weak var newsIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
		let cellTapped = UITapGestureRecognizer (target: self, action:"cellTapped:")
//		self.addGestureRecognizer(cellTapped)
        // Initialization code
    }

	
	func cellTapped(recognizer: UITapGestureRecognizer) {
		parentViewController?.showSpecificNew(self.tag)
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let controller = storyboard.instantiateViewControllerWithIdentifier("NewsTabViewController") as UIViewController
		
//		self.presentViewController(controller, animated: true, completion: nil)
		
	}
	
}
