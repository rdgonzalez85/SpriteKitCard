//
//  GameScene.swift
//  SpriteKitCard
//
//  Created by Rodrigo Gonzalez on 5/3/16.
//  Copyright (c) 2016 Rodrigo Gonzalez. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    
    override func didMoveToView(view: SKView) {
        let wolf = Card(cardNamed: .CreatureDragon)
        wolf.position = CGPointMake(100,200)
        addChild(wolf)
        
        let bear = Card(cardNamed: .CreatureBear)
        bear.position = CGPointMake(300, 200)
        addChild(bear)
    }
}
