import UIKit
import UserNotifications
let calendar = Calendar(identifier:  .gregorian)

var Data = [goal(ggimage: "1.jpg",ggtitle: "1",ggdate: "2015-04-01T11:42"),    ]

let dateFormatter = DateFormatter()


class goal:Codable{
    var gimage: String
    var gtitle: String
    var gdate: String
    
    
    init(ggimage:String , ggtitle:String, ggdate: String) {
        self.gimage = ggimage
        self.gtitle = ggtitle
        self.gdate = ggdate
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone}
    
    
    
    func repeatNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Pizza Time!!"
        content.body = "Monday is Pizza Day"
        content.categoryIdentifier = "pizza.reminder.category"
        var dateComponents = DateComponents()
        // a more realistic example for Gregorian calendar. Every Monday at 11:30AM
        dateComponents.hour = 11
        dateComponents.minute = 30
        dateComponents.weekday = 2
        dateComponents.second = 0
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true)
        let request = UNNotificationRequest(identifier: "pizza.reminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("error in pizza reminder: \(error.localizedDescription)")
            }
        }
        print("added notification:\(request.identifier)")
        
    }

}

