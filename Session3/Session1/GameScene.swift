//
//  GameScene.swift
//  Session1
//
//  Created by Apple on 8/28/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Nodes
    var plane:SKSpriteNode!
    var enemy:SKSpriteNode!
    var bullets : [SKSpriteNode] = []
    var enemies : [SKSpriteNode] = []
    var enemiesBullet : [SKSpriteNode] = []
    //
    var lastUpdateTime : NSTimeInterval = -1
    
    // Counters
    var bulletIntervalCount = 0
    var enemyIntervalCount = 0
    
    override func didMoveToView(view: SKView) {
        addBackground()
        addPlane()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesMoved")
        print("touches count: \(touches.count)")
        if let touch = touches.first {
            // 1
            let currentTouchPosition = touch.locationInNode(self)
            let previousTouchPosition = touch.previousLocationInNode(self)
            
            // 2 Calculate movement vector and then move the plane by this vector
            plane.position = currentTouchPosition.subtract(previousTouchPosition).add(plane.position)
        }
    }
    
    override func update(currentTime: NSTimeInterval) {
        print("\(currentTime)")
        
        if lastUpdateTime == -1 {
            lastUpdateTime = currentTime
        } else {
            let deltaTime = currentTime - lastUpdateTime
            let deltaTimeInMiliseconds = deltaTime * 1000
            if deltaTimeInMiliseconds > 10 {
//                bulletIntervalCount += 1
//                if bulletIntervalCount > 10 {
//                    bulletIntervalCount = 0
//                    addBullet()
//                }
                
                self.enemyIntervalCount += 1
                if self.enemyIntervalCount > 100 {
                    self.enemyIntervalCount = 0
                    addEnemy()
                }
                
                lastUpdateTime = currentTime
            }
        }
        
        for (bulletIndex, bullet) in bullets.enumerate() {
            for (enemyIndex, enemy) in enemies.enumerate() {
                // 1
                let bulletFrame = bullet.frame
                let enemyFrame = enemy.frame
                
                // 2
                if CGRectIntersectsRect(bulletFrame, enemyFrame) {
                    // 3
                    bullet.removeFromParent()
                    enemy.removeFromParent()
                    
                    // 4
                    bullets.removeAtIndex(bulletIndex)
                    enemies.removeAtIndex(enemyIndex)
                }
            }
        }
        
//        for bullet in bullets {
//            bullet.position.y += 30
//        }
        
        for enemy in enemies {
            enemy.position.y -= 10
        }
    }
    func addEnemyBullet()  {
//        let enemyBullet = SKSpriteNode(fileNamed: "enemy_bullet.png")
//        
//        enemyBullet.position = CGPoint(x: enemy.position.x, y: enemy.position.y)
//        
//        self.addChild(enemyBullet)
//        
//        let bulletFly = SKAction.moveByX(0, y: -20, duration: 0.05)
//        enemyBullet.runAction(SKAction.repeatActionForever(bulletFly))
//
        // 1
        let enemyBullet = SKSpriteNode(imageNamed: "enemy_bullet.png")
        
        // 2
        enemyBullet.position = CGPoint(x: enemy.position.x, y: enemy.position.y+30)
        
        // 3
        self.addChild(enemyBullet)
        
        // 4
        let bulletFly = SKAction.moveByX(0, y: -15, duration: 0.05)
        
        // 5
        enemyBullet.runAction(SKAction.repeatActionForever(bulletFly))
        
        enemiesBullet.append(enemyBullet)
        
    }
    
    func addEnemy() {
        // 1
        self.enemy = SKSpriteNode(imageNamed: "plane1.png")
        
        //2 set random position of enemy
        let dx = UInt32(CGRectGetMaxX(self.frame))
        let rad = CGFloat(arc4random_uniform(dx))
        self.enemy.position.x = rad
        self.enemy.position.y = self.frame.size.height-50
        
        //3 let enemy move
        let moveEnemy = SKAction.moveByX(0, y: -15, duration: 0.05)
        self.enemy.runAction(SKAction.repeatActionForever(moveEnemy))
        
        //4 let enemy shot
//        
//        let enemiesShot = SKAction.runBlock{
//            self.addEnemyBullet()
//        }
//        let Shot = SKAction.sequence([enemiesShot , SKAction.waitForDuration(0.1)])
//        let shotEnemiesForever = SKAction.repeatActionForever(Shot)
//        self.enemy.runAction(SKAction.repeatActionForever(shotEnemiesForever))
        
        addChild(self.enemy)
        
        
        
        //6
        enemies.append(enemy)
    }
    
    func addBullet() {
        // 1
        let bullet = SKSpriteNode(imageNamed: "bullet.png")
        
        // 2
        bullet.position = CGPoint(x: plane.position.x, y: plane.position.y+30)
        
        // 3
        self.addChild(bullet)
        
        // 4
        let bulletFly = SKAction.moveByX(0, y: 35, duration: 0.05)
        
        // 5
        bullet.runAction(SKAction.repeatActionForever(bulletFly))
        
        // 5
        bullets.append(bullet)
    }
    
    func addBackground() {
        // 1
        let background = SKSpriteNode(imageNamed: "background.png")
        
        // 2
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        
        // 3
        addChild(background)
    }
    
    func addPlane() {
        // 1
        plane = SKSpriteNode(imageNamed: "plane3.png")
        
        // 2
        plane.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        // 3
        let shot = SKAction.runBlock {
            self.addBullet()
        }
        let periodShot = SKAction.sequence([shot, SKAction.waitForDuration(0.1)])
        let shotForever = SKAction.repeatActionForever(periodShot)
        
        // 4
        plane.runAction(shotForever)
        
        // 5
        addChild(plane)
    }
}
