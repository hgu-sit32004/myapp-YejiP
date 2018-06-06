//
//  adding.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import UIKit

class adding: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate {

@IBOutlet weak var goal_screen: UIImageView!
@IBOutlet weak var datepick: UIDatePicker!
@IBOutlet weak var goal_lab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //picture
    let imagepicker = UIImagePickerController()
    
    @IBAction func add_pic(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagepicker , animated : true , completion: nil)
        }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            goal_screen.image = image
        }
        dismiss(animated: true, completion:nil)}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveImageDocumentDirectory() ->String {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)[0] as NSString).appendingPathComponent(goal_lab.text!+".png")
        let image = goal_screen.image
        let imageData = UIImageJPEGRepresentation( image! , 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        return paths
        }
    
    func making_obj(){
        let pathss = saveImageDocumentDirectory()
        let newgoal = goal(gimage: pathss , gtitle: goal_lab.text! , gdate: Date(), item_identifier: UUID())
        newgoal.save_item()
    }

/*
    @IBAction func create_obj(_ sender: Any) {
        making_obj()
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
