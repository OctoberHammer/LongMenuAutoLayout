//
//  NewsLongMenuCell.swift
//  ParseStarterProject-Swift
//
//  Created by Ocotober Hammer on 12/9/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class NewsLongMenuCell: UITableViewCell, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


	@IBOutlet weak var newsPages: UIPageControl!

	
	@IBOutlet weak var newsCarusel: UICollectionView!
	

	var parentViewController: StaticLongMenu?
	var newsCatalog = ["Первая новость о чем-то", "Вторая новость о чем-то другом", "Третья новость о чем-то вообще невероятном"]
	
	
    override func awakeFromNib() {
        super.awakeFromNib()

    }
	
	func ReloadNewsData()
	{

		
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let screenSize: CGRect = UIScreen.mainScreen().bounds
		let orientation = UIDevice.currentDevice().orientation
		var screenWidth: CGFloat = 0.0
		var screenHeight: CGFloat = 0.0
		if (orientation == UIDeviceOrientation.Portrait) || (orientation == UIDeviceOrientation.PortraitUpsideDown) {
			screenWidth = screenSize.width
			screenHeight = screenSize.height}
		else {
			screenWidth = screenSize.height
			screenHeight = screenSize.width
		}
		
		return CGSize(width: screenWidth, height: 260.0)
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		newsPages.currentPage = 0;
		newsPages.numberOfPages = newsCatalog.count;
//		print("\(newsCatalog.count)")
		return newsCatalog.count;
	}
//MARK: тут мы будем отмечать точками текущую новость
	func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
//		newsPages.currentPage = cell.tag;
	}

	func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		newsPages.currentPage = indexPath.row;
	}
	
	//MARK: Ячейка карусели
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("oneNewsCell", forIndexPath: indexPath) as! OneNewsCollectionViewCell
		
		let nextNew = newsCatalog[indexPath.row];
		cell.newsHeader.text = nextNew;
		cell.tag = indexPath.row;

		cell.parentViewController = self.parentViewController;
		

		return cell
	}
	
	
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



//extension NewsLongMenuCell : UICollectionViewDelegateFlowLayout {
//
//	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//		let itemsPerRow:CGFloat = 4
//		let hardCodedPadding:CGFloat = 5
//		let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
//		let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
//		return CGSize(width: itemWidth, height: itemHeight)
//	}
//	
//}
