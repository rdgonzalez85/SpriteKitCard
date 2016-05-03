//
//  GameViewController.swift
//  SpriteKitCard
//
//  Created by Rodrigo Gonzalez on 5/3/16.
//  Copyright (c) 2016 Rodrigo Gonzalez. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene.
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
