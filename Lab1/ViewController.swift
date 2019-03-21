//
//  ViewController.swift
//  Lab1
//
//  Created by Ahsan Mughal on 25/01/2019.
//  Copyright © 2019 Ahsan Mughal. All rights reserved.
//

import UIKit
import ChameleonFramework
class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: (CardButtons.count + 1) / 2)
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var CardButtons: [UIButton]!
    @IBOutlet weak private var ScoreLabel: UILabel!
    @IBOutlet weak private var newGameButton: CustomButton!
    
    // MARK: ViewDidLoad
    // Initializing UI related elements on start
    override func viewDidLoad() {
        super.viewDidLoad()
        flipCountLabel.text = "Flips: \(0)"
        
        
        ScoreLabel.text = "Score: \(0)"
        let x = game.theme.getrandomtheme()
        emojiArray = x.themearray
        view.backgroundColor = GradientColor(UIGradientStyle.leftToRight, frame: view.frame, colors: [x.GradientColors[0],x.GradientColors[1]])
        for a in CardButtons.indices{
            CardButtons[a].backgroundColor = x.CardClr
           CardButtons[a].layer.borderWidth = 1
           CardButtons[a].layer.borderColor = UIColor.flatSkyBlue.cgColor
        }
       
        }
     // MARK: CardPressed
     // Functionality when user presses any card
    @IBAction func touchcard(_ sender: UIButton) {
        
        if let cardNumber = CardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            } else {
            print("chosen card was not in cardButtons")
        }
    }
     // MARK: NewGame Pressed
    // Fnctionality for starting NEWGAME
    @IBAction func NewGamePressed(_ sender: UIButton) {
       newGameButton.shake() // Custom Button Shake Method
        let alert = UIAlertController(title: "Aewsome", message: "Are you sure you want to start new game?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.newgame()
           // Setting Alert Controller
        })
        let cancelaction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelaction)
        present(alert, animated: true, completion: nil)
        // Adding Actions and Presenting Alert
        }
     // MARK: Start NewGame Function
    // Initializing New Game Objects
    func newgame(){
        game = Concentration(numberOfPairsOfCards: (CardButtons.count + 1) / 2)
        let temp = game.theme.getrandomtheme()
        emojiArray = temp.themearray
         view.backgroundColor = GradientColor(UIGradientStyle.leftToRight, frame: view.frame, colors: [temp.GradientColors[0],temp.GradientColors[1]])
        for a in CardButtons.indices{
            CardButtons[a].backgroundColor = temp.CardClr
        }
        updateViewFromModel()
    }
     // MARK: UpdateView
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipcount)"
        ScoreLabel.text = "Score: \(game.score)"
       for index in CardButtons.indices {
            let button = CardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = CardButtons[index].backgroundColor
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? view.backgroundColor : CardButtons[index].backgroundColor
                // Updating Model based on current game condition
            }
        }
    }
     // MARK: AddTheme Function
    // User Can add theme using one line of codes
    func AddTheme(ThemeEmojiList: [String],themeName: String){
        game.theme.addTheme(themeCollection: ThemeEmojiList, themeName: themeName)
    }
    var emojiArray : [String] = []
    var emoji = [Int:String]()
     // MARK: Assigning Emoji to Cards
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiArray.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiArray.count)))
            print(emojiArray[randomIndex])
            emoji[card.identifier] = emojiArray.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}
