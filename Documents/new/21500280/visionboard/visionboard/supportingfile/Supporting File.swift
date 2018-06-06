import UIKit
import Foundation
import UserNotifications
let calendar = Calendar(identifier:  .gregorian)

//var Data = [goal(ggimage: "1.jpg",ggtitle: "1",ggdate: ),    ]
var Data = [goal]()
let dateFormatter = DateFormatter()

}









/*
class goal : Decodable{

    
    init (gimage: URL,gtitle:String,gdate:Date){
        self.gimage = gimage
        self.gtitle = gtitle
        self.gdate = gdate
    }


    func repeatNotification(){
        let content = UNMutableNotificationContent()
        content.title = "vision reminder"
        content.body = self.gtitle
        content.categoryIdentifier = self.gtitle
        //사진 추가
        
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: self.gdate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)

        let request = UNNotificationRequest(identifier: self.gtitle, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("error in pizza reminder: \(error.localizedDescription)")
            }
        }
        print("added notification:\(request.identifier)")
        
    }

}


extension goal{
   
    enum myclass: String, CodingKey {
        case gimage = "gimage"
        case gtitle = "gtitle"
        case gdate = "gdate"
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: myclass.self)
        let gimage = try container.decode(URL.self, forKey: .gimage)
        let gtitle = try container.decode(String.self, forKey: .gtitle)
        let gdate = try container.decode(Date.self, forKey: .gdate)
        self.init(gimage: gimage,gtitle:gtitle,gdate:gdate)
    }

}*/


let json = """
{
"gimage": ""
"gtitle": "hi"
"gdate": ""
}
""".data(using: .utf8)!
let mystruct = try JSONDecoder().decode(goal.self,from: json)
