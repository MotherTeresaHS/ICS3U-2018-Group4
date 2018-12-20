
// Created on: Dec-2018
// Created by Nicholas
// Created for: ICS3U
// This program is the template for the ICS3U final project

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

var numberPerPattern = 2

class SplashScene: SKScene {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        splashSceneBackground.name = "splash Scene Background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.splashSceneBackground.removeAllActions()
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view?.presentScene(mainMenuScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    
    
    override func didMove(to view: SKView) {
        let startButton = SKSpriteNode(imageNamed:"IMG_0882.PNG")
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        startButton.name = "start button"
        startButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/2)
        self.addChild(startButton)
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "start button" {
                let mainGameScene = GameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
        }
    }
        
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var redButton = SKSpriteNode(imageNamed:"IMG_1098.PNG")
    var greenButton = SKSpriteNode(imageNamed:"IMG_1097.PNG")
    var yellowButton = SKSpriteNode(imageNamed:"IMG_1099.PNG")
    var blueButton = SKSpriteNode(imageNamed:"IMG_1100.PNG")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed:"IMG_1103.PNG")
        background.name = "template"
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
        
        redButton.name = "red button"
        redButton.position = CGPoint(x: 580, y: 390)
        self.addChild(redButton)
        
        greenButton.name = "green button"
        greenButton.position = CGPoint(x: 360, y: 350)
        self.addChild(greenButton)
        
        yellowButton.name = "yellow button"
        yellowButton.position = CGPoint(x: 440, y: 260)
        self.addChild(yellowButton)
        
        blueButton.name = "blue button"
        blueButton.position = CGPoint(x: 475, y: 275)
        self.addChild(blueButton)
        
    }
    @objc func genratePatern() {
        var counter = numberPerPattern + 1
        numberPerPattern = counter
        
        for i in 1 ... numberPerPattern {
            var color : Int = Int(arc4random_uniform(4) + 1)
            
            if color == 1 {
                var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
                brightGreen.name = "green button"
                brightGreen.position = CGPoint(x: 360, y: 350)
                self.addChild(brightGreen)
                pause()
                
            }

        }

        
    }
}

// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
