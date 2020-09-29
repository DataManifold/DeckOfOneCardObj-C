//
//  SHBCardViewController.swift
//  DeckOfOneCard_Obj-C
//
//  Created by Shean Bjoralt on 9/29/20.
//

import UIKit

class SHBCardViewController: UIViewController {
    
    //MARK: - Oulets
    
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - Properties
    
    var cards: [SHBCard] = []
    var image: UIImage?
    
    //MARK: - Lifecycle Function

    override func viewDidLoad() {
        super.viewDidLoad()
        drawCard()
        
    }
    
    //MARK: - Action
    
    @IBAction func newCardButtonPressed(_ sender: Any) {
        drawCard()
    }
    
    
    //MARK: - Helper Methods
    
    func drawCard() {
        SHBCardController.drawNewCard(1) { (card, error) in
            SHBCardController.fetchCardImage(card[0]) { (image) in
                DispatchQueue.main.async {
                    self.cards = card
                    for card in self.cards {
                        self.suitLabel.text = card.suit
                    }
                    self.cardImageView.image = image
                    self.image = image
                }
            }
        }
    }
}
