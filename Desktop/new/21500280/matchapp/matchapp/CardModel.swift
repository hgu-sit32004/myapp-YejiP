//
//  CardModel.swift
//  matchapp
//
//  Created by student38 on 2018. 5. 17..
//  Copyright © 2018년 student38. All rights reserved.
//

import Foundation

class CardModel{
    func getCards() -> [Card]{
        //카드생성에 필요한 어레이를 만든다.
        var generatedCardsArray = [Card]()

        //한쌍을 랜덤하게 만든다.
        for _ in 1...8{
            //random number is generated
            let randomNumber = arc4random_uniform(13) + 1
            // create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            //create the second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
            
            //optional : 
        }
        //어레이를 랜덤화시킨다.
        
        //어레이를 리턴한다.뷰컨트롤러에.
        return generatedCardsArray
    }
}
