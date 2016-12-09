//
//  ViewController.swift
//  HappyHour
//
//  Created by Burke Ramsey on 5/12/16.
//  Copyright © 2016 Burke Ramsey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var cellContent = ["Bridge Street Tap Room",
                       "Lake Charlevoix Brewing Company",
                       "Townhouse Bar",
                       "Tap 30",
                       "City Park Grill",
                       "Noggin Room",
                       "Mitchell Street Pub"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://burkeramsey.com")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if let urlContent = data {
                // https://www.udemy.com/the-complete-ios-9-developer-course/learn/v4/t/lecture/3193384
                let webContent = NSString(data: urlContent, encoding: String.Encoding.utf8.rawValue)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    print(webContent)
                    // do something with data
                })
            
            } else {
                // Show error
            }
        })
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }

    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

