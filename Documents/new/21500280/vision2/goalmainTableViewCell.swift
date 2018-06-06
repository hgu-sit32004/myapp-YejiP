//
//  goalmainTableViewCell.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import UIKit

class goalmainTableViewCell: UITableViewCell {

    @IBOutlet weak var goal_label: UILabel!
    
    @IBAction func completedgoals(_ sender: Any) {
    }
    
    
    @IBAction func delete_goal(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
