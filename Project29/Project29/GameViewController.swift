//
//  GameViewController.swift
//  Project29
//
//  Created by Fayzullayev Nurbek on 22/09/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var currentGame : GameScene?
    
    @IBOutlet var angleSlider: UISlider!
    
    @IBOutlet var angleLabel: UILabel!
    @IBOutlet var velocitySlider: UISlider!
    
    @IBOutlet var velocityLabel: UILabel!
    
    @IBOutlet var launchButton: UIButton!
    
    @IBOutlet var playerNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill
                
                // Present the scene
                view.presentScene(scene)
                currentGame = scene as?GameScene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        angleChange(self)
        velocityChange(self)
        

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angleChange(_ sender: Any) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))°"
    }
    @IBAction func velocityChange(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        angleLabel.isHidden = true
        velocityLabel.isHidden = true
        velocitySlider.isHidden = true
        launchButton.isHidden = true
        currentGame?.launch(angle : Int(angleSlider.value),velocity: Int(velocitySlider.value))
    }
    func activatePlayer(number : Int){
        if number == 1 {
            playerNumber.text = "<<<Player one"
        }else {
            playerNumber.text = "Player two >>>"
        }
        angleSlider.isHidden = false
        angleLabel.isHidden = false
        velocityLabel.isHidden = false
        velocitySlider.isHidden = false
        launchButton.isHidden = false
        
    }
    
}
