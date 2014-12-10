//
//  MasterViewController.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.11.18.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var titleThing: UINavigationItem!
    var detailViewController: DetailViewController? = nil
    var itemGroups = ItemGroups()

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }

//        var imageView = UIImageView(image: UIImage(named: "NANDOR"))
//        imageView.frame.size.width = self.navigationController.navigationBar.frame.size.width
//        imageView.frame.size.height = self.navigationController.navigationBar.frame.size.height
//        imageView.contentMode = .ScaleAspectFit
//        titleThing.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = itemGroups[indexPath.row]
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.detailItem = object.name
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemGroups.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = itemGroups[indexPath.row]
        cell.textLabel?.text = object.name
        return cell
    }
}

