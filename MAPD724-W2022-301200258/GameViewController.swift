/*
 File name: MAPD&@$_W2022_301200258
 Author's name: Matthew Maxwell
 StudentID: 301200258
 Date: March 3th
 App description: landscape view plane game, fly over islands and lose a life when fly though clouds
 Version information: version 2 landscape version
 */

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager
{
    
    // Button Outlets
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    
    // Label Outlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    var currentScene: SKScene?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
               
        // Initialize the Lives and Score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndLabel.isHidden = true
        EndButton.isHidden = true
        
        CollisionManager.gameViewController = self
        
        SetScene(sceneName: "StartScene")
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    //sets lanscape orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            //returns landscape view on iphone device on app start
            return .landscape
        } else {
            //returns landscape view
            return .landscape
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
        {
            
            // Load the SKScene - store a reference in currentScene
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        StartButton.isHidden = false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
    @IBAction func EndButton_Pressed(_ sender: UIButton)
    {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
        
    }
}
