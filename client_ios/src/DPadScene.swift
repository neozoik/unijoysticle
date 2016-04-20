//
//  GameScene.swift
//  c64controller
//
//  Created by Ricardo Quesada on 3/25/16.
//  Copyright (c) 2016 Ricardo Quesada. All rights reserved.
//

import SpriteKit

class DPadScene: ControllerScene {

    var buttons: [SKNode:UInt8] = [:]
    var labelBack:SKLabelNode? = nil

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        for (index, value) in self.children.enumerate() {
             print("Item \(index + 1): \(value)")
        }

        let names_bits = [ "SKSpriteNode_topleft": JoyBits.Up.rawValue | JoyBits.Left.rawValue,
                           "SKSpriteNode_left": JoyBits.Left.rawValue,
                           "SKSpriteNode_bottomleft": JoyBits.Down.rawValue | JoyBits.Left.rawValue,
                            "SKSpriteNode_top": JoyBits.Up.rawValue,
                            "SKSpriteNode_bottom": JoyBits.Down.rawValue,
                            "SKSpriteNode_topright": JoyBits.Up.rawValue | JoyBits.Right.rawValue,
                            "SKSpriteNode_right": JoyBits.Right.rawValue,
                            "SKSpriteNode_bottomright": JoyBits.Down.rawValue | JoyBits.Right.rawValue,
                            "SKSpriteNode_fire": JoyBits.Fire.rawValue]

        for (key,value) in names_bits {
            let node = childNodeWithName(key)
            assert(node != nil, "Invalid name")
            buttons[node!] = value
        }

        labelBack = childNodeWithName("SKLabelNode_back") as! SKLabelNode?
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */

        for touch in touches {

            let location = touch.locationInNode(self)
            if labelBack!.frame.contains(location) {
                self.view?.window!.rootViewController?.dismissViewControllerAnimated(true, completion: {
                    print("finished")
                })
            }

            enableTouch(touch.locationInNode(self))

            sendJoyState()
        }
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {

            disableTouch(touch.previousLocationInNode(self))
            enableTouch(touch.locationInNode(self))

            sendJoyState()
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {

            disableTouch(touch.previousLocationInNode(self))
            disableTouch(touch.locationInNode(self))

            sendJoyState()
        }
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if (touches != nil) {
            for touch in touches! {

                disableTouch(touch.previousLocationInNode(self))
                disableTouch(touch.locationInNode(self))

                sendJoyState()
            }
        }
    }


    func enableTouch(location: CGPoint) {
        for (node, bitmaks) in buttons {
            if node.frame.contains(location) {
                joyState = joyState | bitmaks
            }
        }
    }

    func disableTouch(location: CGPoint) {
        for (node, bitmaks) in buttons {
            if node.frame.contains(location) {
                joyState = joyState & ~bitmaks
            }
        }
    }
}