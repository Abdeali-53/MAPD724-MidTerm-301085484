import SpriteKit
import GameplayKit

class Island: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        //Changing the position to X-Axis.
        if(position.x <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        //Changing the position to X-Axis.
        position.x = 730
        // get a pseudo-random number from -313 to 313 =
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = 1
        Reset()
        //Change the speed of the Island on X-Axis.
        dx = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        //Island on X-Axis.
        position.x -= dx!
    }
}
