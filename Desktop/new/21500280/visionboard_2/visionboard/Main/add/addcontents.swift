
import UIKit

class addcontents: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var img: UIImageView!
    
    
    let imagepicker = UIImagePickerController()
    
    @IBAction func btn_pick(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagepicker , animated : true , completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            img.image = image
        }
    
    dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        //UserDefaults.standard.set  ??
        
        
    }
    
    
}
