//
//  DetailViewController.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.11.18.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTitle: UINavigationItem!
    var control = Control()
    var itemGroups = ItemGroups()
    var currentItemGroup:ItemGroup

    required init(coder aDecoder: NSCoder) {
        self.currentItemGroup = self.itemGroups[0]
        super.init(coder: aDecoder)
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailTitle {
                self.currentItemGroup = self.itemGroups.getItemGroup(detail.description)
                label.title = self.currentItemGroup.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table View

    func tableView(tableView: UITableView, didSelectRowAtIndexPath: NSIndexPath) {
        var object = self.currentItemGroup[didSelectRowAtIndexPath.row]

        if (object.cmd == "foff") {
            self.control.fOff(object.label)
        }
        if (object.cmd == "fon") {
            self.control.fOn(object.label)
        }
        if (object.cmd == "fb") {
            self.control.fBright(object.label)
        }
        if (object.cmd == "off") {
            self.control.stop()
        }

        tableView.deselectRowAtIndexPath(didSelectRowAtIndexPath, animated:true)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentItemGroup.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionCell", forIndexPath: indexPath) as UITableViewCell
        
        let object = self.currentItemGroup[indexPath.row]
        cell.textLabel?.text = object.name

        var imageName:String
        switch object.cmd {
        case "foff": imageName = "Down"
        case "fon":  imageName = "Up"
        case "fb":   imageName = "Add"
        case "off":  imageName = "Delete"
        default:     imageName = ""
        }

        if (countElements(imageName) > 0) {
            cell.imageView?.image = UIImage(named:imageName);
        }
        return cell
    }

    func numberOfSectionsInTableView(tableView:UITableView) -> NSInteger {
        return 1
    }
}

