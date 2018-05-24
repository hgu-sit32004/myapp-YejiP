
import UIKit

class Main: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        
        let TitleImageaName = Data[indexPath.row]["TitleImage"]
        let TitleImage = UIImage(named: TitleImageaName!)
        Cell.TitleImageView.image = TitleImage
        Cell.TitleLabel.text = Data[indexPath.row]["TitleLabel"]
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "todash" , sender: self)
    }
    //collectionview end

}

