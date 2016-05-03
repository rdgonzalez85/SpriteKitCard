//  Card.swift
//  SpriteKitCard
//
//  Created by Rodrigo Gonzalez on 4/25/16.
//  Copyright © 2016 Rodrigo Gonzalez. All rights reserved.
//

import Foundation
import SpriteKit

class Card : SKSpriteNode {
    
    var enlarged = false
    var savedPosition = CGPointZero
    var largeTexture: SKTexture?
    let largeTextureFilename: String
    
    enum CardName: Int {
        case CreatureWolf = 0,
        CreatureBear,
        CreatureDragon,
        Energy,
        SpellDeathRay,
        SpellRabid,
        SpellSleep,
        SpellStoneskin
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardNamed: CardName) {
        // initialize properties
        
        var cardTexture : SKTexture
        
        switch cardNamed {
        case .CreatureWolf:
            cardTexture = SKTexture(imageNamed: "card_creature_wolf.png")
            largeTextureFilename = "card_creature_wolf_large.png"
            
        case .CreatureBear:
            cardTexture = SKTexture(imageNamed: "card_creature_bear.png")
            largeTextureFilename = "card_creature_bear_large.png"
            
        case .CreatureDragon:
            cardTexture = SKTexture(imageNamed: "card_creature_dragon.png")
            largeTextureFilename = "card_creature_dragon_large.png"
            
        default:
            cardTexture = SKTexture(imageNamed: "card_back.png")
            largeTextureFilename = "card_back_large.png"
        }
        
        // call designated initializer on super
        
        super.init(texture: cardTexture, color: .clearColor(), size: cardTexture.size())
        
        
        // set properties defined in super
        userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            if enlarged { return }
            
            if touch.tapCount > 1 {
                enlarge()
            }
            
            zPosition = 15
            let liftUp = SKAction.scaleTo(1.2, duration: 0.2)
            runAction(liftUp, withKey: "pickup")
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for _ in touches {
            if enlarged { return }
            
            zPosition = 0
            let dropDown = SKAction.scaleTo(1.0, duration: 0.2)
            runAction(dropDown, withKey: "drop")
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            if let scene = self.scene {
                let location = touch.locationInNode(scene)
                let touchedNode = nodeAtPoint(location)
                touchedNode.position = location
            }
        }
    }
    
    func enlarge() {
        if enlarged {
            let slide = SKAction.moveTo(savedPosition, duration:0.3)
            let scaleDown = SKAction.scaleTo(1.0, duration:0.3)
            runAction(SKAction.group([slide, scaleDown])) {
                self.enlarged = false
                self.zPosition = 0
            }
        } else {
            enlarged = true
            savedPosition = position
            
            if largeTexture != nil {
                texture = largeTexture
            } else {
                largeTexture = SKTexture(imageNamed: largeTextureFilename)
                texture = largeTexture
            }
            
            zPosition = 20
            
            if let parentFrame = parent?.frame {
                
                let newPosition = CGPointMake(CGRectGetMidX(parentFrame), CGRectGetMidY(parentFrame))
                removeAllActions()
                
                let slide = SKAction.moveTo(newPosition, duration:0.3)
                let scaleUp = SKAction.scaleTo(2.5, duration:0.3)
                runAction(SKAction.group([slide, scaleUp]))
            }
            
        }
    }}