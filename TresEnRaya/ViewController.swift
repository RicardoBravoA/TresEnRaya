//
//  ViewController.swift
//  TresEnRaya
//
//  Created by Ricardo Bravo Acuña on 11/06/16.
//  Copyright © 2016 Ricardo Bravo Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winCombination = [[0,1,2], [3,4,5], [6,7,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameActive = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(sender: AnyObject) {
        
        var image = UIImage()
        var msg:String
        
        if gameState[sender.tag] == 0 && gameActive {
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1{
                image = UIImage(named: "nought.png")!
                activePlayer = 2
            }else{
                image = UIImage(named: "cross")!
                activePlayer = 1
            }
            sender.setImage(image, forState: .Normal)
            
            for combination in winCombination {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]]
                    && gameState[combination[1]] == gameState[combination[2]]{
                    
                    gameActive = false
                    
                    if gameState[sender.tag] == 1{
                        msg = "Ganador: Player 1"
                    }else{
                        msg = "Ganador: Player 2"
                    }
                    
                    let alertController = UIAlertController(title: "Mensaje", message: msg, preferredStyle: .Alert)
                
                    let action = UIAlertAction(title: "Jugar de nuevo", style: .Default) { (action) -> Void in
                        self.resetGame()
                    }
                    
                    alertController.addAction(action)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func resetGame(){
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        
        for i in 0 ..< 9 {
            var button: UIButton
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
            
        }
        
    }
    

}

