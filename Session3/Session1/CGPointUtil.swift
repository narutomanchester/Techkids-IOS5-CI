//
//  CGPointUtil.swift
//  Session1
//
//  Created by Apple on 9/4/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

extension CGPoint {
    func add(other : CGPoint) -> CGPoint {
        let retX = self.x + other.x
        let retY = self.y + other.y
        return CGPoint(x: retX, y: retY)
    }
    
    func subtract(other: CGPoint) -> CGPoint {
        return CGPoint(x: self.x - other.x, y: self.y - other.y)
    }
    
    func multiply(ratio : CGFloat) -> CGPoint {
        return CGPoint(x: x * ratio, y: y * ratio)
    }
    
    func distance(other: CGPoint) -> CGFloat {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx * dx + dy * dy)
    }
    
    func normalize() -> CGPoint {
        let length = sqrt(x * x + y * y)
        return CGPoint(x: x / length, y: y / length)
    }
}
