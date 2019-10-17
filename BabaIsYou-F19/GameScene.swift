//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    
 var player:SKSpriteNode!
    var wall:SKSpriteNode!
 let PLAYER_SPEED:CGFloat = 20
     var count1 = 0
     var count2 = 0
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.player = self.childNode(withName: "player") as! SKSpriteNode
        self.enumerateChildNodes(withName: "wall") {
         (node, stop) in
             self.wall = node as! SKSpriteNode
            self.wall.physicsBody = SKPhysicsBody(rectangleOf: self.wall.size)
            self.wall.physicsBody?.affectedByGravity = false
         //wall.physicsBody?.isDynamic = false
            self.wall.physicsBody?.categoryBitMask = 128
            self.wall.physicsBody?.collisionBitMask=0
         //self.wall = self.addChild("wall")as SKSpriteNode
         //self.wall:SKSpriteNode
            
    }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
    
                
                if (nodeA == nil || nodeB == nil) {
                    return
                }
       
                if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
        
                    print("intersecting wall and isblock")
                    count1=1
                }
        
        if (nodeA!.name == "isblock" && nodeB!.name == "stopblock") {
            print("intersecting wall and stop block")
            count2=2
            
        }
        if(count1==1 && count2==2)
        {
            print ("you block the wall");
            
           self.player.physicsBody?.collisionBitMask = 252
           self.wall.physicsBody?.collisionBitMask = 127
          //  self.wall.physicsBody?
        
        
        
        }
    
    }
        
        
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)

        // WHAT NODE DID THE PLAYER TOUCH
        // ----------------------------------------------
        let nodeTouched = atPoint(location).name
        //print("Player touched: \(nodeTouched)")
        
        
        // GAME LOGIC: Move player based on touch
        if (nodeTouched == "upButton") {
            // move up
            self.player.position.y = self.player.position.y + PLAYER_SPEED
        }
        else if (nodeTouched == "downButton") {
            // move down
             self.player.position.y = self.player.position.y - PLAYER_SPEED
        }
        else if (nodeTouched == "leftButton") {
            // move left
             self.player.position.x = self.player.position.x - PLAYER_SPEED
        }
        else if (nodeTouched == "rightButton") {
            // move right
             self.player.position.x = self.player.position.x + PLAYER_SPEED
        }
        
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
