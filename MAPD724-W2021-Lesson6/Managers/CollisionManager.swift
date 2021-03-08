
//  File name: CollisionManager.swift
//  Author name: Abdeali Mody
//  Student ID: 301085484
//  Description: Show the Score calculation of game on every collision of plane with either Island or Cloud.
//  Copyright © 2021 Abdeali Mody. All rights reserved.

import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1HalfHeight = object1.halfHeight!
        let P2HalfHeight = object2.halfHeight!
        let HalfHeights = P1HalfHeight + P2HalfHeight
        
        if(SquaredDistance(point1: P1, point2: P2) < HalfHeights * HalfHeights)
        {
            if(!object2.isColliding!)
            {
                switch object2.name
                {
                case "island":
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
