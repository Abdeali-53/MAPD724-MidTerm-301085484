
//  File name: Plane.swift
//  Author name: Abdeali Mody
//  Student ID: 301085484
//  Description: Reseted the Plane for Lanscape Mode.Also Adjusting the Co-Ordinates .
//  Copyright © 2021 Abdeali Mody. All rights reserved.

import SpriteKit
import GameplayKit

class Plane: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        // constrain on the left - left boundary
        if(position.y <= -310)
        {
            position.y = -310
        }
        
        // constrain on the right - right boundary
        if(position.y >= 310)
        {
            position.y = 310
        }
        
    }
    
    override func Reset()
    {
       
    }
    
    // initialization
    override func Start()
    {
        zPosition = 2
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
