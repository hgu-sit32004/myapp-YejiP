import UIKit
import UserNotifications
class Main: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource{
    var notificationGranted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound])
        {
            (granted, error) in
            self.notificationGranted = granted
            if let error = error {
                print("granted, but Error in notification permission:\(error.localizedDescription)")
            }
        }}
    

    
    func load(){

        if let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data {
            Data = try! PropertyListDecoder().decode([goal].self, from: savedData)
        }
    }

    //MARK: - collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        load()
        return Data.count
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        let TitleImageaName = Data[indexPath.row].gimage
        let TitleImage = UIImage(named: TitleImageaName)
        
        Cell.TitleImageView.image = TitleImage
        Cell.TitleLabel.text = (Data[indexPath.row] ).gtitle


        return Cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "todash" , sender: self)
    }


    //collectionview end
}



