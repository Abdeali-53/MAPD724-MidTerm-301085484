import SpriteKit
import GameplayKit

class Ocean: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        //Changing the position to X-Axis.
        if(position.x <= -773)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        //Change the reset position to X-Axis.
        position.x = 773
    }
    
    // initialization
    override func Start()
    {
        zPosition = 0
        //Change the speed of the ocean on X-Axis.
        dx = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        //Moving the Ocean along X-Axis
        position.x -= dx!
    }
}
