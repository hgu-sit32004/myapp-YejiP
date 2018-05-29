import UIKit

class addcontents: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var picname: UITextField!
    @IBOutlet weak var img: UIImageView!
    

    let imagepicker = UIImagePickerController()
    
    @IBAction func btn_pick(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagepicker , animated : true , completion: nil)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            img.image = image
            
            
    }
        dismiss(animated: true, completion:nil)}
 
    
    
    
    func saveImageDocumentDirectory(){
        let fileManager = FileManager.default
        
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)[0] as NSString).appendingPathComponent(picname.text!)
        //let filepath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let image = img.image
        let imageData = UIImageJPEGRepresentation(image!, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
        
        Data.append(["TitleImage" : paths, "TitleLabel" : picname.text! , "DATE" : 20180501])
        picname.text = Data[1]["TitleImage"] as! String

        //Data[0]["TitleImage"] = paths
    }
 /*
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getImage(){
        let fileManager = FileManager.defaultManager
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("apple.jpg")
        if fileManager.fileExistsAtPath(imagePAth){
            self.imagepicker.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }
    }
    
   */
    
    func save(){
        UserDefaults.standard.set( Data , forKey: "savedData")
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        saveImageDocumentDirectory()
        save()

        
    }
    
}


/*       let img = UIImage(named: picname.text!)
let data = UIImagePNGRepresentation(img!)
UserDefaults.standard.set(data, forKey: "image")
var retrievedImage = UserDefaults.standard.object(forKey: "image") as AnyObject


UserDefaults.standard.synchronize()
NSLog("Image stored?")
viewDidLoad()
*/
