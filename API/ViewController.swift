//
//  ViewController.swift
//  API
//
//  Created by Andrew Udell on 9/21/14.
//  Copyright (c) 2014 Udell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/bobdylan",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
                
                if let myName = responseObject.valueForKey("name") as? String {
                    self.myNameLabel.text = myName;
                }
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

