//
//  Page2ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page2ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var skviewPage2: SKView!
    var scene: SKScene!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.skviewPage2 = SKView(frame: view.frame)
        view.addSubview(skviewPage2)
        self.scene = Page2.init(size: view.frame.size)
        guard let scene2 = self.scene as? Page2 else {return}
        scene2.delegatePresenting = self
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        skviewPage2.ignoresSiblingOrder = true
        skviewPage2.showsFPS = false
        skviewPage2.showsNodeCount = false
        skviewPage2.showsPhysics = false
        skviewPage2.presentScene(self.scene)
    }
    
    override public func viewDidLayoutSubviews() {
        skviewPage2.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage2.frame = self.liveViewSafeAreaGuide.layoutFrame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page2 {
                scene.updatePosition()
            }
            if let scene = self.scene as? Page2Cont {
                scene.updatePosition()
            }
                
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                guard let scene = self.scene as? Page2 else {return}
                scene.gotoHeart()
    }
}

extension Page2ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(gotoHeart) = message else { return }
        if gotoHeart == "gotoHeart" {
            guard let scene = self.scene as? Page2 else {return}
            scene.gotoHeart()
        }
    }
}

extension Page2ViewController: PresentingProtocol {
    public func present(viewController: UIViewController) {
        
    }
    
    public func dismiss(viewController: UIViewController) {
        
    }
    
    public func changeTo(scene: SKScene) {
        skviewPage2.presentScene(scene)
        self.scene = scene
    }
}


