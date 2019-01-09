
// Created on: Dec-2018
// Created by Nicholas
// Created for: ICS3U
// This program is the template for the ICS3U final project

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit


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
    var redButtonPressed = false
    var greenButtonPressed = false
    var yellowButtonPressed = false
    var blueButtonPressed = false
    var redButton = SKSpriteNode(imageNamed:"IMG_1098.PNG")
    var greenButton = SKSpriteNode(imageNamed:"IMG_1097.PNG")
    var yellowButton = SKSpriteNode(imageNamed:"IMG_1099.PNG")
    var blueButton = SKSpriteNode(imageNamed:"IMG_1100.PNG")
    var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
    var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
    var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
    var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
    let waitOneSec = SKAction.wait(forDuration: 1.0)
    
    
    override func didMove(to view: SKView) {
        var patternCounter = 0
        
        let background = SKSpriteNode(imageNamed:"IMG_1103.PNG")
        background.name = "template"
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
        
        redButton.name = "red button"
        redButton.position = CGPoint(x: 580, y: 390)
        self.addChild(redButton)
        
        brightRed.name = "bright red"
        brightRed.position = CGPoint(x: 580, y: 390)
        
        greenButton.name = "green button"
        greenButton.position = CGPoint(x: 360, y: 350)
        self.addChild(greenButton)
        
        brightGreen.name = "bright green"
        brightGreen.position = CGPoint(x: 360, y: 350)
        
        yellowButton.name = "yellow button"
        yellowButton.position = CGPoint(x: 440, y: 260)
        self.addChild(yellowButton)
        
        brightYellow.name = "bright yellow"
        brightYellow.position = CGPoint(x: 440, y: 260)
        
        blueButton.name = "blue button"
        blueButton.position = CGPoint(x: 475, y: 275)
        self.addChild(blueButton)
        
        brightBlue.name = "bright blue"
        brightBlue.position = CGPoint(x: 475, y: 275)
        
        //if  {
        //}
        var colorOne : Int = Int(arc4random_uniform(4) + 1)
        var colorTwo : Int = Int(arc4random_uniform(4) + 1)
        var colorThree : Int = Int(arc4random_uniform(4) + 1)
        var colorFour : Int = Int(arc4random_uniform(4) + 1)
        var colorFive : Int = Int(arc4random_uniform(4) + 1)
        
        
        if colorOne == 1 {
            var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
            brightRed.name = "bright red"
            brightRed.position = CGPoint(x: 580, y: 390)
            self.addChild(brightRed)
            
            brightRed.run(waitOneSec){
                self.removeChildren(in: [brightRed])
                if colorOne == colorTwo {
                    colorTwo = colorOne + 1
                    if colorTwo > 4 {
                        colorTwo = 2
                        two()
                    }
                    else{
                    two()
                }
        }
                else{
                two()
            }
        }
        }
        if colorOne == 2{
        var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
        brightGreen.name = "bright green"
        brightGreen.position = CGPoint(x: 360, y: 350)
        self.addChild(brightGreen)
        
        brightGreen.run(waitOneSec){
            self.removeChildren(in: [brightGreen])
            if colorOne == colorTwo {
                colorTwo = colorOne + 1
                if colorTwo > 4 {
                    colorTwo = 2
                    two()
                }
                else{
                two()
                }
            }
            else{
            two()
        }}
    
        }
        if colorOne == 3 {
            var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
            brightYellow.name = "bright yellow"
            brightYellow.position = CGPoint(x: 440, y: 260)
            self.addChild(brightYellow)
            
            brightYellow.run(waitOneSec){
                self.removeChildren(in: [brightYellow])
                if colorOne == colorTwo {
                    colorTwo = colorOne + 1
                    if colorTwo > 4 {
                        colorTwo = 2
                        two()
                    }else{
                    two()
            }}else{
                two()
                }
        }
        }
        if colorOne == 4 {
            var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
            brightBlue.name = "bright blue"
            brightBlue.position = CGPoint(x: 475, y: 275)
            self.addChild(brightBlue)
            
            brightBlue.run(waitOneSec){
                self.removeChildren(in: [brightBlue])
                if colorOne == colorTwo {
                    colorTwo = colorOne + 1
                    if colorTwo > 4 {
                        colorTwo = 2
                        two()
                    }else{
                    two()
            }}else{
                two()
            }}
        }
        
        
        
        
        
        func two() {
        if colorTwo == 1 {
            var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
            brightRed.name = "bright red"
            brightRed.position = CGPoint(x: 580, y: 390)
            self.addChild(brightRed)
            
            brightRed.run(waitOneSec){
                
                self.removeChildren(in: [brightRed])
                if colorTwo == colorThree {
                    colorThree = colorTwo + 1
                    if colorThree > 4 {
                        colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        if colorTwo == 2 {
            var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
            brightGreen.name = "bright green"
            brightGreen.position = CGPoint(x: 360, y: 350)
            self.addChild(brightGreen)
            
            brightGreen.run(waitOneSec){
                self.removeChildren(in: [brightGreen])
                if colorTwo == colorThree {
                    colorThree = colorTwo + 1
                    if colorThree > 4 {
                        colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        
        if colorTwo == 3 {
            var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
            brightYellow.name = "bright yellow"
            brightYellow.position = CGPoint(x: 440, y: 260)
            self.addChild(brightYellow)
            
            brightYellow.run(waitOneSec){
                self.removeChildren(in: [brightYellow])
                if colorTwo == colorThree {
                    colorThree = colorTwo + 1
                    if colorThree > 4 {
                        colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        if colorTwo == 4 {
            
            var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
            brightBlue.name = "bright blue"
            brightBlue.position = CGPoint(x: 475, y: 275)
            self.addChild(brightBlue)
            
            brightBlue.run(waitOneSec)
                self.removeChildren(in: [brightYellow])
                if colorTwo == colorThree {
                colorThree = colorTwo + 1
                if colorThree > 4 {
                colorThree = 2
                    
                three()
                }else{
                three()
                }}else{
                three()
        }}
        
        }
        
        
        
        func three() {
            if colorThree == 1 {
                var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: 580, y: 390)
                self.addChild(brightRed)
                
                brightRed.run(waitOneSec){
                    self.removeChildren(in: [brightRed])
                    if colorThree == colorFour {
                        colorFour = colorThree + 1
                        if colorFour > 4 {
                            colorFour = 2
                            four()
                        }else{
                        four()
                    }}
                    else{
                    four()
                }}
            }
            if colorThree  == 2 {
                var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
                brightGreen.name = "bright green"
                brightGreen.position = CGPoint(x: 360, y: 350)
                self.addChild(brightGreen)
                
                brightGreen.run(waitOneSec){
                    self.removeChildren(in: [brightGreen])
                    if colorThree == colorFour {
                        colorFour = colorThree + 1
                        if colorFour > 4 {
                            colorFour = 2
                            four()
                        }else{
                        four()
                    }}else{
                    four()
                }}
            }
            
            if colorThree == 3 {
                var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
                brightYellow.name = "bright yellow"
                brightYellow.position = CGPoint(x: 440, y: 260)
                self.addChild(brightYellow)
                
                brightYellow.run(waitOneSec){
                    self.removeChildren(in: [brightYellow])
                    if colorThree == colorFour {
                        colorFour = colorThree + 1
                        if colorFour > 4 {
                            colorFour = 2
                            four()
                        }else{
                        four()
                    }}else{
                    four()
                }}
            }
            if colorThree  == 4 {
                
                var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
                brightBlue.name = "bright blue"
                brightBlue.position = CGPoint(x: 475, y: 275)
                self.addChild(brightBlue)
                
                brightBlue.run(waitOneSec){
                    self.removeChildren(in: [brightBlue])
                    if colorThree == colorFour {
                        colorFour = colorThree + 1
                        if colorFour > 4 {
                            colorFour = 2
                            four()
                        }else{
                        four()
                    }}else{
                    four()
                }}
            }
        }
        func four() {
            if colorFour == 1 {
                var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: 580, y: 390)
                self.addChild(brightRed)
                
                brightRed.run(waitOneSec){
                    self.removeChildren(in: [brightRed])
                    
                }
            }
            if colorFour  == 2 {
                var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
                brightGreen.name = "bright green"
                brightGreen.position = CGPoint(x: 360, y: 350)
                self.addChild(brightGreen)
                
                brightGreen.run(waitOneSec){
                    self.removeChildren(in: [brightGreen])
                }
            }
            
            if colorFour == 3 {
                var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
                brightYellow.name = "bright yellow"
                brightYellow.position = CGPoint(x: 440, y: 260)
                self.addChild(brightYellow)
                
                brightYellow.run(waitOneSec){
                    self.removeChildren(in: [brightYellow])
                }
            }
            if colorFour  == 4 {
                
                var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
                brightBlue.name = "bright blue"
                brightBlue.position = CGPoint(x: 475, y: 275)
                self.addChild(brightBlue)
                
                brightBlue.run(waitOneSec){
                    self.removeChildren(in: [brightBlue])
                }
            }
        
        }


}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "red button" {
                redButtonPressed = true
                var brightRed = SKSpriteNode(imageNamed: "IMG_1107.PNG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: 580, y: 390)
                self.addChild(brightRed)
                
                brightRed.run(waitOneSec){
                self.removeChildren(in: [brightRed])
            }
                }
            if touchedNodeName == "green button" {
                greenButtonPressed = true
                var brightGreen = SKSpriteNode(imageNamed:"IMG_1108.PNG")
                brightGreen.name = "bright green"
                brightGreen.position = CGPoint(x: 360, y: 350)
                self.addChild(brightGreen)
                
                brightGreen.run(waitOneSec){
                    self.removeChildren(in: [brightGreen])
                }
            }
            if touchedNodeName == "yellow button" {
                yellowButtonPressed = true
                var brightYellow = SKSpriteNode(imageNamed:"IMG_1106.PNG")
                brightYellow.name = "bright yellow"
                brightYellow.position = CGPoint(x: 440, y: 260)
                self.addChild(brightYellow)
                
                brightYellow.run(waitOneSec){
                    self.removeChildren(in: [brightYellow])
                }
            }
            if touchedNodeName == "blue button" {
                blueButtonPressed = true
                var brightBlue = SKSpriteNode(imageNamed:"IMG_1105.PNG")
                brightBlue.name = "bright blue"
                brightBlue.position = CGPoint(x: 475, y: 275)
                self.addChild(brightBlue)
                
                brightBlue.run(waitOneSec){
                    self.removeChildren(in: [brightBlue])
                }
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
