import UIKit
import UserNotifications
let calendar = Calendar(identifier:  .gregorian)

var Data = [goal(ggimage: "1.jpg",ggtitle: "1",ggdate: "2015-04-01T11:42"),    ]

var noti = UNMutableNotificationContent()
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
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let dateg = dateFormatter.date(from: ggdate)!
        
    }
    
    func notification(){
        noti.title = self.gtitle
        /*
         코더에 뭐 들어가야하는지?
        date matchijng 어케하는지?
        UNCalendarNotificationTrigger(coder: <#T##NSCoder#>)
        _ = UNCalendarNotificationTrigger(dateMatching: gdate ,repeats: false)
        */
    }
}


/*
 
 extension UNNotificationAttachment {
 
 static func create(identifier: String, image: UIImage, options: [NSObject : AnyObject]?) -> UNNotificationAttachment? {
 let fileManager = FileManager.default
 let tmpSubFolderName = ProcessInfo.processInfo.globallyUniqueString
 let imageFileIdentifier = identifier
 let fileURL = tmpSubFolderName.appendingPathComponent(imageFileIdentifier)
 guard let imageData = UIImagePNGRepresentation(image) else {
 return nil
 }
 try imageData.write(to: fileURL)
 let imageAttachment = try UNNotificationAttachment.init(identifier: imageFileIdentifier, url: fileURL, options: options)
 return imageAttachment
 } catch {
 print("error " + error.localizedDescription)
 }
 return nil
 }
 }
 */
