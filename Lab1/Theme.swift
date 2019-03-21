//
//  Theme.swift
//  Lab1
//
//  Created by Ahsan Mughal on 06/02/2019.
//  Copyright © 2019 Ahsan Mughal. All rights reserved.
//

import Foundation
import ChameleonFramework
import UIKit
class Theme {
    var emojicollection : [[String]]
    var themename : [String]
    var BGcolor : [UIColor]
    var CardColor : UIColor
    init() {
       emojicollection = [
            ["💀","😱","🙀","😈","🎃","👻","👹","🥶","😳","🙄","😎","🤠","👽","☠️","👾"],
            ["🎄","🌲","🌿","🐲","🌵","🎍","🐉","🍀","🦚","🌳","🌱","🎋","🌾","🍂","🍁"],
            ["🐶","🐱","🐭","🐹","🦊","🐻","🐼","🐯","🦁","🐥","🐣","🐴","🦆","🦋","🐔"],
            ["🌞","🌏","🌒","🌈","🌗","🌚","🌑","💥","🌝","🌛","🌜","🌦","❄️","🌈","⚡️"],
            ["🍏","🍎","🍊","🍑","🍇","🍅","🍒","🍐","🍋","🍉","🍓","🍍","🥥","🥝","🍈"],
            ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏹","🏏","🥏","🏑","🥅","⛳️"],
            ["🍔","🍣","🥮","🍢","🍧","🍿","🎂","🌮","🍕","🥯","🥖","🥐","🧀","🍰","🥪"]
        ]
        themename = ["Faces","Jungle","Animals","Weather","Fruits","Sports","Food"]
        BGcolor = [UIColor.flatLime,UIColor.flatGreen]
        CardColor = UIColor.orange
    }
    func getrandomtheme() -> (themearray : [String],themename: String,GradientColors: [UIColor],CardClr: UIColor) {
        let randomindex = Int(arc4random_uniform(UInt32(emojicollection.count)))
        switch themename[randomindex] {
        case "Faces":
            BGcolor = [UIColor(hexString: "#000000")!,UIColor(hexString: "#434343")!]
            CardColor = UIColor.flatNavyBlue
        case "Jungle":
            BGcolor = [UIColor(hexString: "#5A3F37")!,UIColor(hexString: "#2C7744")!]
            CardColor = UIColor.flatForestGreen
        case "Animals":
            BGcolor = [UIColor(hexString: "#f46b45")!,UIColor(hexString: "#eea849")!]
            CardColor = UIColor.flatSand
        case "Weather":
            BGcolor = [UIColor(hexString: "#1c92d2")!,UIColor(hexString: "#f2fcfe")!]
            CardColor = UIColor.flatBlue
        case "Fruits":
            BGcolor = [UIColor(hexString: "#30E8BF")!,UIColor(hexString: "#FF8235")!]
            CardColor = UIColor.flatRed
        case "Sports":
            BGcolor = [UIColor(hexString: "#E6DADA")!,UIColor(hexString: "#274046")!]
            CardColor = UIColor.flatWhite
        case "Food":
            BGcolor = [UIColor(hexString: "#D1913C")!,UIColor(hexString: "#FFD194")!]
            CardColor = UIColor.flatGray
        default:
            BGcolor = [UIColor.flatLime,UIColor.flatGreen]
            CardColor = UIColor.orange
        }
        
        return (emojicollection[randomindex],themename[randomindex],BGcolor,CardColor)
    }
    func addTheme(themeCollection: [String],themeName: String) {
        emojicollection.append(themeCollection)
        themename.append(themeName)
        print("AddedNow: " , emojicollection[emojicollection.count-1] , " " , "Name : " , themename[themename.count-1])
    }
}
