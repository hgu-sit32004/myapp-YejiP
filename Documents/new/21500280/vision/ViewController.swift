//
//  ViewController.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let goaltem = goal(gimage: "df", gtitle: "dfa", gdate: Date(),item_identifier:UUID())
        let goals = datamanager.load_all(goal.self)
        print (goals)
        goaltem.save_item()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


