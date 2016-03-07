//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Lich King on 16/3/6.
//  Copyright © 2016年 Lich King. All rights reserved.
//

import UIKit

class MyTableViewCell:KWTableViewCell {
    private let myLabel:UILabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(myLabel)
        
        myLabel.frame = CGRectMake(20, 0, 100, 40)
//        myLabel.backgroundColor = UIColor.redColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func update(item: NSObject) {
        let myItem = item as! MyItem
        self.myLabel.text = myItem.name
    }
}

class MyItem : NSObject {
    var name:String!
    convenience init(name:String) {
        self.init()
        self.name = name
    }
}

class ViewController: UIViewController {
    var tableView:KWTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.edgesForExtendedLayout = .None
        
        let datasource = [MyItem(name: "first"),
                        MyItem(name: "second"),
                        MyItem(name: "third"),
                        MyItem(name: "forth"),
                        MyItem(name: "fifth"),
                        MyItem(name: "sixth"),
                         MyItem(name: "senventh")]
        tableView = KWTableView(tableViewCellClass: MyTableViewCell.self, datasource: datasource,designedCellHeight: 60)
        tableView.clickBlock = {(item,indexPath) -> Void in
            let myItem = item as! MyItem
            print(myItem.name)
        }
        self.view.addSubview(tableView)
        
        tableView.frame = CGRectMake(0, 30, 320, 500)
        
        // test update
        let testButton = UIButton(type: .System)
        testButton.setTitle("点我吧", forState: .Normal)
        testButton.addTarget(self, action: "click", forControlEvents: .TouchUpInside)
        self.view.addSubview(testButton)
        testButton.frame = CGRectMake(100, 500, 100, 40)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func click() {
        // TEST ALTER
        tableView.update(MyItem(name: "updated"), index: 0)
    }
}
