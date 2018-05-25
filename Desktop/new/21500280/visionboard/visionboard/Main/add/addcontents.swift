
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
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if let data = UIImagePNGRepresentation(image) {
                let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
                try? data.write(to: filename)
            }
        }
    dismiss(animated: true, completion: nil)
    }
    
    if var image = info[UIImagePickerControllerOriginalImage] as? UIImage  {
        if let data = UIImageJPEGRepresentation( image, 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
            try? data.write(to: filename)
        }}
    
    var imgname:String?
    
    @IBAction func save(_ sender: Any) {
        
    }
}
