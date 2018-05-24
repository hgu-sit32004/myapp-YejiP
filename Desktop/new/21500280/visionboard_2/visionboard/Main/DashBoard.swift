
import UIKit

class DashBoard: UIViewController {
    //MARK: - Variable
    
    @IBOutlet weak var PageView: UIView!
    
    //Variable end
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let PageViewVC = self.storyboard?.instantiateViewController(withIdentifier: "PageViewVC") as! PageView
        PageViewVC.view.frame = PageView.bounds
        PageView.addSubview(PageViewVC)
        PageViewVC.didMove(didMove(toParentViewController: self))
       
    }

}
