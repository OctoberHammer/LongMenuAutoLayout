//
//  LongMenuViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Ocotober Hammer on 12/9/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class LongMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	@IBOutlet weak var showMenuButtom: UIBarButtonItem!
	
	var sections = ["Новости","Новинки", "Акционные товары", "Рекомендуемые товары", ""]
	var newsCatalog = [News]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
		imageView.contentMode = .ScaleAspectFit
		let image = UIImage(named: "logo-Happiness")
		imageView.image = image
		navigationItem.titleView = imageView
		//MARK: регистрируем наши ячейки для ТэйблВью
		tableView.registerNib(UINib(nibName: "cellContacts", bundle: nil), forCellReuseIdentifier: "cellContacts")
		tableView.registerNib(UINib(nibName: "RecommendedTableViewCell", bundle: nil), forCellReuseIdentifier: "recommendedCell")
		
		if self.revealViewController() != nil {
			showMenuButtom.target = self.revealViewController()
			showMenuButtom.action = "revealToggle:"
			
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		if CoreDataManager().isNewsEmpty()
		{
			ParseManager().readNews()
		}
		else
		{
			ReloadNewsData()
		}
    }

//TODO: Мы перечитываем новости
//Но ТэйблВью нам релоадить не нужно, нам нужно их передать в ячейку, а те в свою очередь обновят КоллекшенВью	
	func ReloadNewsData()
	{
		let CoreResult = CoreDataManager().readNews()
		if CoreResult.code == 0
		{
			newsCatalog = CoreResult.news!
//			tableView.reloadData()
		}
		else
		{
			let alert = UIAlertView(title: "Ошибка загрузки", message: CoreResult.message!, delegate: self, cancelButtonTitle: "OK")
			alert.show()
		}
		
	}
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		switch indexPath.row{
		case 0: return 259
		case 4: return 92
		default: return 259
		}
	}
	
	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		switch indexPath.row {
		case 4:
			cell.backgroundColor=UIColor.clearColor()
			let gradient : CAGradientLayer = CAGradientLayer()
			//0xfebf00 - более темный
			let upperColor = UIColor(red: 0xFE/255.0, green: 0xBF/255.0, blue: 0x00/255.0, alpha: 1.0);
			//0xfcda03 - более СВЕТЛЫЙ
			let lowerColor = UIColor(red: 0xFC/255.0, green: 0xDA/255.0, blue: 0x03/255.0, alpha: 1.0);
			var arrayColors:Array<AnyObject> = [upperColor, lowerColor]
			gradient.colors=arrayColors
			gradient.frame = cell.bounds
//			cell.layer.insertSublayer(gradient, atIndex: UInt32(indexPath.row))
			cell.backgroundView = UIView()
			cell.backgroundView?.layer.insertSublayer(gradient, atIndex: 0)
		default:
			return
		}
	}
	
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0: let cell = self.tableView.dequeueReusableCellWithIdentifier("newsCarusel") as! NewsLongMenuCell!
		cell.newsCatalog = self.newsCatalog;
		//		cell.newsCarusel.frame.size.width = tableView.frame.width
//		cell.parentViewController = self;
		return cell
		case 3:
			//MARK: Рекоммендуемые товары
			let cell = self.tableView.dequeueReusableCellWithIdentifier("recommendedCell") as! RecommendedTableViewCell!
			cell.headerLabel.text = sections[indexPath.row]
		return cell
		case 4:	let cell = self.tableView.dequeueReusableCellWithIdentifier("cellContacts") as! cellContacts!
		let phoneNumber = "8727-2775477"
		cell.phoneLabel.text = "Телефон: \(phoneNumber)";
		let hotlineNumber = "0086-4000-679-8004"
		cell.hotlineLabel.text = "Горячая линия: \(hotlineNumber)";
		return cell
		default:	let cell = self.tableView.dequeueReusableCellWithIdentifier("newsCarusel") as! NewsLongMenuCell!
//		cell.parentViewController = self;
		return cell
		}
	}
	
	//TODO: открываем каталог
	@IBAction func showCatalog(sender: AnyObject) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let controller = storyboard.instantiateViewControllerWithIdentifier("navCatalog") as! MainController
		
		self.presentViewController(controller, animated: true, completion: nil)
	}
	//TODO: показываем боковое меню
	@IBAction func showMenu(sender: AnyObject) {

	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showSpecificNews" {
			let sendingCell = sender as! OneNewsCollectionViewCell;
			print("\(sendingCell.tag)")
			let index = sendingCell.tag;
			let currentNew = newsCatalog[index]
			let destinationController = segue.destinationViewController as! OneNewController
			destinationController.headerText = currentNew.header
			destinationController.textNews = currentNew.text
			destinationController.newsIcon =  currentNew.icon
			destinationController.imageGallary = currentNew.newsPhoto
//			let currentNew = newsCatalog[index]
			
		}
	}
	
	func showSpecificNew(index: Int) {
		print("\(index)")
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let destinationController = storyboard.instantiateViewControllerWithIdentifier("OneNewController") as! OneNewController
		//controller.
		let currentNew = newsCatalog[index]
		
		destinationController.headerText = currentNew.header
		destinationController.textNews = currentNew.text
		destinationController.newsIcon =  currentNew.icon
		destinationController.imageGallary = currentNew.newsPhoto
		self.presentViewController(destinationController, animated: true, completion: nil)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
