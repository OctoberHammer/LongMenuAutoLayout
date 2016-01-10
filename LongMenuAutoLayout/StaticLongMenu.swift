//
//  StaticLongMenu.swift
//  ParseStarterProject-Swift
//
//  Created by Ocotober Hammer on 12/24/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class StaticLongMenu: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	@IBOutlet weak var newProducts: UICollectionView!
	@IBOutlet weak var actionedGoods: UICollectionView!
	@IBOutlet weak var recommendedGoods: UICollectionView!
	@IBOutlet weak var bottomCellContacts: cellContacts!
	
	@IBOutlet weak var newsCollectionView: UICollectionView!

	@IBOutlet weak var newsCarusel: NewsLongMenuCell!
	@IBOutlet weak var showMenuButtom: UIBarButtonItem!
	
	@IBOutlet weak var newProduct: UITableViewCell!
	
	var newsCatalog = ["Первая новость о чем-то", "Вторая новость о чем-то другом", "Третья новость о чем-то вообще невероятном"]
	var prodCatalog = ["Первый продукт", "Второй продукт", "Третий продукт", "Четвертый продукт", "Пятый продукт", "Шестой продукт", "Седьмой продукт", "8-й продукт", "9-й продукт"]
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
//	var recGoods = ["First", "Second"]
//	var recImages = ["1 - 85", "2 - 85"]
	let howManyRecomededGoods = 8;
//	var recGoods = ["Первый продукт", "Второй продукт", "Третий продукт", "Четвертый продукт", "Пятый продукт", "Шестой продукт", "Седьмой продукт", "8-й продукт"]
	var recGoods = ["Первый продукт", "Второй продукт", "Третий продукт", "Четвертый продукт", "Пятый продукт"]
	
	
	let howManyActionedGoods = 3
	var actProducts = ["Четвертый продукт", "Пятый продукт", "Шестой продукт"]
	//var actImages = ["Detox", "pasta propolis", "shampoo"]
	
	var howManyNewGoods = 2;
	var newGoods = ["Седьмой продукт", "8-й продукт", "Another product"];
	//var newImages = ["2 - 85", "3 - 85"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//MARK: NavigationBar
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
		imageView.contentMode = .ScaleAspectFit
		let image = UIImage(named: "logo-Happiness")
		imageView.image = image
		navigationItem.titleView = imageView
		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 44.0
		self.automaticallyAdjustsScrollViewInsets = false
		newProducts.sizeToFit()
		recommendedGoods.sizeToFit()
//		print("размер содержимого: \(newProducts.collectionViewLayout.collectionViewContentSize())");
		print("высота newProducts: \(newProducts.frame.height)")
		print("высота rec: \(recommendedGoods.frame.height)")

		//MARK: News Carusel
		
		//newsCarusel.newsCatalog = self.newsCatalog;
		//		cell.newsCarusel.frame.size.width = tableView.frame.width
		newsCarusel.parentViewController = self;
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSizeMake(310.0, 151.0)
		layout.minimumLineSpacing = 10.0
		layout.minimumInteritemSpacing = 8
		layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		layout.scrollDirection = .Horizontal
		newsCollectionView.collectionViewLayout = layout;


        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ReloadProductData", name:"ReloadProductData", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "ReloadNewsData", name:"ReloadNewsData", object: nil)


    }

 
	func ReloadProductData()
	{
		
//		prodCatalog = appDelegate.productTable
//		recGoods.removeAll();
//		
//        for var i=0; i < howManyRecomededGoods; i++ {
//			recGoods.append(prodCatalog[i]);
//		
//        }
//		
//        actProducts.removeAll();
//		for var i=13; i < 13+howManyActionedGoods; i++ {
//			actProducts.append(prodCatalog[i]);
//		}
//		
//        newGoods.removeAll();
//		for var i=prodCatalog.count-howManyNewGoods-1; i < prodCatalog.count; i++ {
//			newGoods.append(prodCatalog[i]);
//		}
		
        tableView.reloadData()
		
		
		
	}
	
	
	override func viewDidAppear(animated: Bool) {
		//MARK: Contacts
		let phoneNumber = "8727-2775477"
		bottomCellContacts.phoneLabel.text = "Телефон: \(phoneNumber)";
		let hotlineNumber = "0086-4000-679-8004"
		bottomCellContacts.hotlineLabel.text = "Горячая линия: \(hotlineNumber)";
	}

	
	
	//MARK: Мы перечитываем новости
	//Но ТэйблВью нам релоадить не нужно, нам нужно их передать в ячейку, а те в свою очередь обновят КоллекшенВью
	func ReloadNewsData()
	{
//		newsCatalog = appDelegate.newsTable
			//			tableView.reloadData()
		
		
	}
	
	//MARK: Left and Right Buttons
	
	@IBAction func showCatalog(sender: AnyObject) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let controller = storyboard.instantiateViewControllerWithIdentifier("revealProductCatalog") as UIViewController
		
		self.presentViewController(controller, animated: true, completion: nil)
	}

	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

	}
	
	func getDocumentsDirectory() -> NSString {
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		let documentsDirectory = paths[0]
		return documentsDirectory
	}
	
	func showSpecificNew(index: Int) {

	}
	
	
	func showSpecificRecGood(index: Int) {

	}
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


	
	override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		if indexPath.row == 4 {
		}
	}

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		switch indexPath.row{
		case 0:
//			print("лэй аут \(newsCollectionView.collectionViewLayout)")
//			let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//			layout.itemSize = CGSizeMake(310.0, 151.0)
//			layout.minimumLineSpacing = 10.0
//			layout.minimumInteritemSpacing = 8
//			layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//			layout.scrollDirection = .Horizontal
//			newsCollectionView.collectionViewLayout = layout;
			return 227
		case 1:
			print("высота новинок : \(newProducts.frame.height )");
			return 320;//newProducts.frame.height
		case 2: return 168
		case 3:
//			print("")
//			print("размер содержимого: \(recommendedGoods.collectionViewLayout.collectionViewContentSize())");
			print("высота рекомендуемых товаров: \(recommendedGoods.frame.height)");
			return recommendedGoods.frame.height + 20
		default: return 98
		}
	}
	
//	override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//		switch indexPath.row{
//		case 0: return 227
//		case 1: return 166
//		case 2: return 168
//		case 3:
//			tableView.rowHeight = UITableViewAutomaticDimension
//			return 142.0
//		default: return 98
//		}
//	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	//MARK: Recommended Collection View
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	

	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView.tag {
		case 3: return recGoods.count
		case 2: return actProducts.count
		case 1: return newGoods.count
		default: return 0
		}
	}
	
	func cellTapped(recognizer: UITapGestureRecognizer) {
		print("cell tapped")
		//let tag = recognizer.
		//parentViewController?.showSpecificRecGood(self.tag)
	}
	
	//MARK: Размеры Ячеек в КоллекшенВью
//	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//		switch collectionView.tag {
//		case 1: print("\(collectionView.tag)")
//		let cellSize: CGSize = CGSizeMake(self.newsCarusel.frame.width, 151)
//		return cellSize
//		default:		let cellSize: CGSize = CGSizeMake(130, 130)
//		return cellSize
//		}
//	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		switch collectionView.tag {
		//MARK: РЕКОМЕНДОВАННЫЕ ТОВАРЫ, заполнение коллекшена
		case 3: let cell = recommendedGoods.dequeueReusableCellWithReuseIdentifier("recProductCell", forIndexPath: indexPath) as! recProductCell
		cell.recProdLabel.text = recGoods[indexPath.row]
		cell.recProdLabel.tag = indexPath.row;


		cell.parentViewController = self
		cell.tag = indexPath.row
		
		let cellTapped = UITapGestureRecognizer(target: cell.recProdLabel, action: "cellTapped")
		let cellTapped1 = UITapGestureRecognizer(target: cell.recProductImage, action: "cellTapped")
		return cell
			
		//MARK: Акционные товары, заполнение коллекшена
		case 2: let cell = actionedGoods.dequeueReusableCellWithReuseIdentifier("actProdCell", forIndexPath: indexPath) as! ActProdCell
		cell.actLabel.text = actProducts[indexPath.row]
		cell.tag = indexPath.row;



		return cell
		//MARK: Новинки
		case 1: let cell = newProducts.dequeueReusableCellWithReuseIdentifier("recProductCell", forIndexPath: indexPath) as! recProductCell
		cell.recProdLabel.text = newGoods[indexPath.row]
		cell.tag = indexPath.row;

		
		return cell
		default:
			let cell = recommendedGoods.dequeueReusableCellWithReuseIdentifier("recProductCell", forIndexPath: indexPath) as! recProductCell
			cell.recProdLabel.text = recGoods[indexPath.row]
			return cell
		}

	}

}
