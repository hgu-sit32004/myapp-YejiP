import UIKit



var Data = [goal(ggimage: "1.jpg",ggtitle: "1",ggdate: 20180501),    ]


class goal:Codable{
    var gimage: String
    var gtitle: String
    var gdate: NSInteger
    
    init(ggimage:String, ggtitle:String, ggdate: NSInteger) {
        self.gimage = ggimage
        self.gtitle = ggtitle
        self.gdate = ggdate
    }
}
