
// Created on: Dec-Jan-2018
// Created by Nicholas
// Created for: ICS3U
// This program is the template for the ICS3U final project

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

var score = Int()
class GameScene: SKScene {
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
    
    //override func  update(_ currentTime: TimeInterval) {
        //
        
    //}
    
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
    
    let background = SKSpriteNode(imageNamed:"IMG_1128.JPG")
    
    override func didMove(to view: SKView) {
        let startButton = SKSpriteNode(imageNamed:"IMG_0882.PNG")
        /* Setup your scene here */
        background.name = "template"
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
        
        
        
        startButton.name = "start button"
        startButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/2)
        self.addChild(startButton)
        
        
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
                let mainGameScene = PlayScene(size: self.size)
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

class PlayScene: SKScene, SKPhysicsContactDelegate {
    var redButtonPressed = false
    var greenButtonPressed = false
    var yellowButtonPressed = false
    var blueButtonPressed = false
    var redButton = SKSpriteNode(imageNamed:"IMG_1113.JPG")
    var greenButton = SKSpriteNode(imageNamed:"IMG_1114.JPG")
    var yellowButton = SKSpriteNode(imageNamed:"IMG_1126.JPG")
    var blueButton = SKSpriteNode(imageNamed:"IMG_1115.PNG")
    var brightRed = SKSpriteNode(imageNamed:"IMG_1123.JPG")
    var brightGreen = SKSpriteNode(imageNamed:"IMG_1124.JPG")
    var brightYellow = SKSpriteNode(imageNamed:"IMG_5698.jpg")
    var brightBlue = SKSpriteNode(imageNamed:"IMG_1122.JPG")
    let waitOneSec = SKAction.wait(forDuration: 1.0)
    let waitHalfSec = SKAction.wait(forDuration: 0.8)
    var userPatternOne = 0
    var userPatternTwo = 0
    var userPatternThree = 0
    var userPatternFour = 0
    var colorOne : Int = Int(arc4random_uniform(4) + 1)
    var colorTwo : Int = Int(arc4random_uniform(4) + 1)
    var colorThree : Int = Int(arc4random_uniform(4) + 1)
    var colorFour : Int = Int(arc4random_uniform(4) + 1)
    var patternCounter = 0
    var scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var firstColor = 0
    var secondColor = 0
    var thirdColor = 0
    var fourthColor = 0
    var redSelected = 0
    var greenSelected = 0
    var yellowSelected = 0
    var blueSelected = 0
    let background = SKSpriteNode(imageNamed:"IMG_1132.JPG")
    override func didMove(to view: SKView) {
        
        background.name = "template"
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
        
        redButton.name = "red button"
        redButton.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
        redButton.setScale(0.66)
        self.addChild(redButton)
        
        brightRed.name = "bright red"
        brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
        brightRed.setScale(0.66)
        
        greenButton.name = "green button"
        greenButton.setScale(0.95)
        greenButton.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
        self.addChild(greenButton)
        
        brightGreen.name = "bright green"
        brightGreen.setScale(0.95)
        brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
        
        yellowButton.name = "yellow button"
        yellowButton.setScale(0.234)
        yellowButton.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
        self.addChild(yellowButton)
        
        brightYellow.name = "bright yellow"
        brightYellow.setScale(0.234)
        brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
        
        blueButton.name = "blue button"
        blueButton.setScale(0.16)
        blueButton.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
        self.addChild(blueButton)
        
        brightBlue.name = "bright blue"
        brightBlue.setScale(0.7)
        brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        scoreLabel.fontSize = 50
        scoreLabel.position = CGPoint(x: frame.size.width / 2.7, y: frame.size.height / 2.3)
        self.addChild(scoreLabel)
        
        
        if colorOne == 1 {
            var brightRed = SKSpriteNode(imageNamed:"IMG_1123.JPG")
            brightRed.name = "bright red"
            brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
            brightRed.setScale(0.66)
            self.addChild(brightRed)
            
            //firstColor = 1
            
            brightRed.run(waitOneSec){
                self.removeChildren(in: [brightRed])
                if self.colorOne == self.colorTwo {
                    self.colorTwo = self.colorOne + 1
                    if self.colorTwo > 4 {
                        self.colorTwo = 2
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
        var brightGreen = SKSpriteNode(imageNamed:"IMG_1124.JPG")
        brightGreen.name = "bright green"
            brightGreen.setScale(0.95)
            brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
        self.addChild(brightGreen)
        
            //firstColor = 2
            
        brightGreen.run(waitOneSec){
            self.removeChildren(in: [brightGreen])
            if self.colorOne == self.colorTwo {
                self.colorTwo = self.colorOne + 1
                if self.colorTwo > 4 {
                    self.colorTwo = 2
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
            var brightYellow = SKSpriteNode(imageNamed:"IMG_5698.jpg")
            brightYellow.name = "bright yellow"
            brightYellow.setScale(0.234)
            brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
            self.addChild(brightYellow)
            
            //firstColor = 3
            
            brightYellow.run(waitOneSec){
                self.removeChildren(in: [brightYellow])
                if self.colorOne == self.colorTwo {
                    self.colorTwo = self.colorOne + 1
                    if self.colorTwo > 4 {
                        self.colorTwo = 2
                        two()
                    }else{
                    two()
            }}else{
                two()
                }
        }
        }
        if colorOne == 4 {
            var brightBlue = SKSpriteNode(imageNamed:"IMG_1122.JPG")
            brightBlue.name = "bright blue"
            brightBlue.setScale(0.7)
            brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
            self.addChild(brightBlue)
            
            //firstColor = 4
            brightBlue.run(waitOneSec){
                self.removeChildren(in: [brightBlue])
                if self.colorOne == self.colorTwo {
                    self.colorTwo = self.colorOne + 1
                    if self.colorTwo > 4 {
                        self.colorTwo = 2
                        two()
                    }else{
                    two()
            }}else{
                two()
            }}
        }
        
        
        
        
        
        func two() {
        if colorTwo == 1 {
            var brightRed = SKSpriteNode(imageNamed: "IMG_1123.JPG")
            brightRed.name = "bright red"
            brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
            brightRed.setScale(0.66)
            self.addChild(brightRed)
            
            //secondColor = 1
            
            brightRed.run(waitOneSec){
                
                self.removeChildren(in: [brightRed])
                if self.colorTwo == self.colorThree {
                    self.colorThree = self.colorTwo + 1
                    if self.colorThree > 4 {
                        self.colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        if colorTwo == 2 {
            var brightGreen = SKSpriteNode(imageNamed: "IMG_1124.JPG")
            brightGreen.name = "bright green"
            brightGreen.setScale(0.95)
            brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
            self.addChild(brightGreen)
            
            //secondColor = 2
            
            brightGreen.run(waitOneSec){
                self.removeChildren(in: [brightGreen])
                if self.colorTwo == self.colorThree {
                    self.colorThree = self.colorTwo + 1
                    if self.colorThree > 4 {
                        self.colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        
        if colorTwo == 3 {
            var brightYellow = SKSpriteNode(imageNamed: "IMG_5698.jpg")
            brightYellow.name = "bright yellow"
            brightYellow.setScale(0.234)
            brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
            self.addChild(brightYellow)
            
            //secondColor = 3
            
            brightYellow.run(waitOneSec){
                self.removeChildren(in: [brightYellow])
                if self.colorTwo == self.colorThree {
                    self.colorThree = self.colorTwo + 1
                    if self.colorThree > 4 {
                        self.colorThree = 2
                        three()
                    }else{
                    three()
                }}else{
                three()
            }}
        }
        if colorTwo == 4 {
            
            var brightBlue = SKSpriteNode(imageNamed: "IMG_1122.JPG")
            brightBlue.name = "bright blue"
            brightBlue.setScale(0.7)
            brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
            self.addChild(brightBlue)
            
            //secondColor = 4
            
            brightBlue.run(waitOneSec)
                self.removeChildren(in: [brightBlue])
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
                var brightRed = SKSpriteNode(imageNamed: "IMG_1123.JPG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
                brightRed.setScale(0.66)
                self.addChild(brightRed)
                
                //thirdColor = 1
                
                brightRed.run(waitOneSec){
                    self.removeChildren(in: [brightRed])
                    if self.colorThree == self.colorFour {
                        self.colorFour = self.colorThree + 1
                        if self.colorFour > 4 {
                            self.colorFour = 2
                            four()
                        }else{
                        four()
                    }}
                    else{
                    four()
                }}
            }
            if colorThree  == 2 {
                var brightGreen = SKSpriteNode(imageNamed:"IMG_1124.JPG")
                brightGreen.name = "bright green"
                brightGreen.setScale(0.95)
                brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
                self.addChild(brightGreen)
                
                //thirdColor = 2
                
                brightGreen.run(waitOneSec){
                    self.removeChildren(in: [brightGreen])
                    if self.colorThree == self.colorFour {
                        self.colorFour = self.colorThree + 1
                        if self.colorFour > 4 {
                            self.colorFour = 2
                            four()
                        }else{
                        four()
                    }}else{
                    four()
                }}
            }
            
            if colorThree == 3 {
                var brightYellow = SKSpriteNode(imageNamed: "IMG_5698.jpg")
                brightYellow.name = "bright yellow"
                brightYellow.setScale(0.234)
                brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
                self.addChild(brightYellow)
                
                //thirdColor = 3
                
                brightYellow.run(waitOneSec){
                    self.removeChildren(in: [brightYellow])
                    if self.colorThree == self.colorFour {
                        self.colorFour = self.colorThree + 1
                        if self.colorFour > 4 {
                            self.colorFour = 2
                            four()
                        }else{
                        four()
                    }}else{
                    four()
                }}
            }
            if colorThree  == 4 {
                
                var brightBlue = SKSpriteNode(imageNamed: "IMG_1122.JPG")
                brightBlue.name = "bright blue"
                brightBlue.setScale(0.7)
                brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
                self.addChild(brightBlue)
                
                //thirdColor = 4
                
                brightBlue.run(waitOneSec){
                    self.removeChildren(in: [brightBlue])
                    if self.colorThree == self.colorFour {
                        self.colorFour = self.colorThree + 1
                        if self.colorFour > 4 {
                            self.colorFour = 2
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
                var brightRed = SKSpriteNode(imageNamed: "IMG_1123.JPG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
                brightRed.setScale(0.66)
                self.addChild(brightRed)
                
                //fourthColor = 1
                
                brightRed.run(waitOneSec){
                    self.removeChildren(in: [brightRed])
                    
                }
            }
            if colorFour  == 2 {
                var brightGreen = SKSpriteNode(imageNamed: "IMG_1124.JPG")
                brightGreen.name = "bright green"
                brightGreen.setScale(0.95)
                brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
                self.addChild(brightGreen)
                
                //fourthColor = 2
                
                brightGreen.run(waitOneSec){
                    self.removeChildren(in: [brightGreen])
                }
            }
            
            if colorFour == 3 {
                var brightYellow = SKSpriteNode(imageNamed: "IMG_5698.jpg")
                brightYellow.name = "bright yellow"
                brightYellow.setScale(0.234)
                brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
                self.addChild(brightYellow)
                
                //fourthColor = 3
                
                brightYellow.run(waitOneSec){
                    self.removeChildren(in: [brightYellow])
                }
            }
            if colorFour  == 4 {
                
                var brightBlue = SKSpriteNode(imageNamed: "IMG_1122.JPG")
                brightBlue.name = "bright blue"
                brightBlue.setScale(0.7)
                brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
                self.addChild(brightBlue)
                
                //fourthColor = 4
                
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
                var brightRed = SKSpriteNode(imageNamed: "IMG_1123.JPG")
                brightRed.name = "bright red"
                brightRed.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 1.3)
                brightRed.setScale(0.66)
                self.addChild(brightRed)
                redSound()
                self.redSelected = 1
                
                if self.firstColor == 0{
                    self.firstColor = 1
                }
                else if self.secondColor == 0{
                    self.secondColor = 1
                    }
                else if self.thirdColor == 0{
                    self.thirdColor = 1
                }
                else if self.fourthColor == 0{
                    self.fourthColor = 1
                }
                
                
                brightRed.run(waitHalfSec) {
                    
                    
                
                    
                self.removeChildren(in: [brightRed])
                    self.pattern()
            }
            }
        
            if touchedNodeName == "green button" {
                greenButtonPressed = true
                var brightGreen = SKSpriteNode(imageNamed: "IMG_1124.JPG")
                brightGreen.name = "bright green"
                brightGreen.setScale(0.95)
                brightGreen.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 1.3)
                self.addChild(brightGreen)
                self.greenSelected = 1

                
                
                if self.firstColor == 0{
                    self.firstColor = 2
                }
                else if self.secondColor == 0{
                    self.secondColor = 2
                }
                else if self.thirdColor == 0{
                    self.thirdColor = 2
                }
                else if self.fourthColor == 0{
                    self.fourthColor = 2
                }
                
                brightGreen.run(waitHalfSec){
                    
                    
                    
                    
                    self.removeChildren(in: [brightGreen])
                    self.pattern()
                }
            }
            if touchedNodeName == "yellow button" {
                yellowButtonPressed = true
                var brightYellow = SKSpriteNode(imageNamed: "IMG_5698.jpg")
                brightYellow.name = "bright yellow"
                brightYellow.setScale(0.234)
                brightYellow.position = CGPoint(x: frame.size.width / 4, y: frame.size.height / 5)
                self.addChild(brightYellow)
                self.yellowSelected = 1
                
                
                if self.firstColor == 0{
                    self.firstColor = 3
                }
                else if self.secondColor == 0{
                    self.secondColor = 3
                }
                else if self.thirdColor == 0{
                    self.thirdColor = 3
                }
                else if self.fourthColor == 0{
                    self.fourthColor = 3
                }
                
                brightYellow.run(waitHalfSec){
                    
                    
                    
                    self.removeChildren(in: [brightYellow])
                    self.pattern()
                }
            }
            if touchedNodeName == "blue button" {
                blueButtonPressed = true
                var brightBlue = SKSpriteNode(imageNamed: "IMG_1122.JPG")
                brightBlue.name = "bright blue"
                brightBlue.setScale(0.7)
                brightBlue.position = CGPoint(x: frame.size.width / 1.3, y: frame.size.height / 7.5)
                self.addChild(brightBlue)
                self.blueSelected = 1
                
                
                if self.firstColor == 0{
                    self.firstColor = 4
                }
                else if self.secondColor == 0{
                    self.secondColor = 4
                }
                else if self.thirdColor == 0{
                    self.thirdColor = 4
                }
                else if self.fourthColor == 0{
                    self.fourthColor = 4
                }
                
                
                brightBlue.run(waitHalfSec){
                    
                    
                    
                    self.removeChildren(in: [brightBlue])
                    self.pattern()
                }
            }
            
        }
    }
    //override func  update(_ currentTime: TimeInterval) {
        
        
    
    //}
    
    func redSound(){
        redButton.run(SKAction.playSoundFileNamed("Bluegrass.mp3", waitForCompletion: false))
    }
    func pattern()
    {
        if firstColor > 0 && firstColor != colorOne || secondColor > 0 && secondColor != colorTwo || thirdColor > 0 && thirdColor != colorThree || fourthColor > 0 && fourthColor != colorFour { 
            
            let mainGameScene = YouLoseScene(size: self.size)
            self.view!.presentScene(mainGameScene)
        }

        if firstColor == colorOne && secondColor == colorTwo && thirdColor == colorThree && fourthColor == colorFour{
            
            
            score = score + 1
            scoreLabel.text = "Score: \(score)"
            
            let mainGameScene = PlayScene(size: self.size)
            self.view!.presentScene(mainGameScene)
            
            
        }
        else{
            
        }
    }
    
    
                
            }

class YouLoseScene: SKScene, SKPhysicsContactDelegate {
    let retryLabel = SKLabelNode(fontNamed: "Chalkduster")
    let mainMenuButton = SKSpriteNode(imageNamed:"IMG_0935.PNG")
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0, green:0, blue:0, alpha: 0)
        retryLabel.text = "GAME OVER"
        retryLabel .horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        retryLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        retryLabel.fontSize = 100
        retryLabel.position = CGPoint(x: frame.size.width / 8, y: frame.size.height / 1.5)
        self.addChild(retryLabel)
        
        mainMenuButton.name = "main menu button"
        mainMenuButton.setScale(0.95)
        mainMenuButton .position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2.5)
        self.addChild(mainMenuButton)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "main menu button" {
                let mainGameScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainGameScene)
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

let scene = GameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
