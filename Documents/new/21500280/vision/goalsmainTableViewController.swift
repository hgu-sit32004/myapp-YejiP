//
//  goalsmainTableViewController.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import UIKit

class goalsmainTableViewController: UITableViewController {

    var goal_items:[goal]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    func loadData(){
        goal_items = [goal]()
        goal_items = datamanager.load_all(goal.self).sorted(by: {
            $0.gdate < $1.gdate
        })
        tableView.reloadData()
        
    }
    
    @IBAction func add_new(_ sender: Any) {
        let add_alert = UIAlertController(title: "new goal", message: "enter a title", preferredStyle: .alert)
        add_alert.addTextField{(textfield:UITextField) in textfield.placeholder = "goal title"
        }
        add_alert.addAction(UIAlertAction(title:"create", style: .default, handler:{(action:UIAlertAction) in
            guard let title = add_alert.textFields?.first?.text else {return}
            let newgoal = goal(gimage: title, gtitle: title, gdate: Date(), item_identifier: UUID())
            newgoal.save_item()
            
            self.goal_items.append(newgoal)
            
            let indextPath = IndexPath.init(row: self.tableView.numberOfRows(inSection: 0), section: 0)
            
            self.tableView.insertRows(at: [indextPath], with: .automatic)
            
        }))
        
            add_alert.addAction(UIAlertAction(title:"cancel",style: .default, handler:{(action:UIAlertAction) in
                
            }))
        
    add_alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            
            self.present(add_alert, animated:true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal_items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! goalmainTableViewCell
        let goal_item = goal_items[indexPath.row]
        cell.goal_label.text = goal_item.gtitle
        

    

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
