
//  File name: Cloud.swift
//  Author name: Abdeali Mody
//  Student ID: 301085484
//  Description: Did few changes related to the placement of Cloud.
//  Copyright © 2021 Abdeali Mody. All rights reserved.


import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        //Changing the position to X-Axis.
        if(position.x <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        dx = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        dy = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        // get a pseudo-random number from -262 to 262 =
        let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.y = CGFloat(randomY)
        
        let randomX:Int = (randomSource?.nextInt(upperBound: 10))! + 756
        position.x = CGFloat(randomX)
        
        isColliding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = 3
        alpha = 0.5
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= dx!
        position.y -= dy!
    }
}
