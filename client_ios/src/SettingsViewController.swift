/****************************************************************************
 http://retro.moe/unijoysticle

 Copyright 2016 Ricardo Quesada

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 ****************************************************************************/

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ipaddress: UITextField!

    @IBOutlet weak var handicapSlider: UISlider!
    @IBOutlet weak var handicapLabel: UILabel!

    @IBOutlet weak var jumpSlider: UISlider!
    @IBOutlet weak var jumpLabel: UILabel!

    @IBOutlet weak var movementSlider: UISlider!
    @IBOutlet weak var movementLabel: UILabel!

    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var gravitySlider: UISlider!

    let sliderStep:Float = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = NSUserDefaults.standardUserDefaults()

        // ip address
        let addr = settings.valueForKey("ipaddress")
        if (addr != nil) {
            ipaddress.text = addr as! String?
        }
        else {
            ipaddress.text = SERVER_IP_ADDRESS
        }

        // handicap
        let handicapValue = settings.valueForKey("handicap")
        var handiFloat = Float(HANDICAP_RATE)
        if (handicapValue != nil) {
            handiFloat = handicapValue as! Float
        }
        handicapSlider.setValue(handiFloat, animated: false)
        handicapLabel.text = "\(handiFloat)"

        // movement threshold
        let movementValue = settings.valueForKey("movement threshold")
        var movementFloat = Float(MOVEMENT_THRESHOLD)
        if (movementValue != nil) {
            movementFloat = movementValue as! Float
        }
        movementSlider.setValue(movementFloat, animated: false)
        movementLabel.text = "\(movementFloat)"

        // jump threshold
        let jumpValue = settings.valueForKey("jump threshold")
        var jumpFloat = Float(JUMP_THRESHOLD)
        if (jumpValue != nil) {
            jumpFloat = jumpValue as! Float
        }
        jumpSlider.setValue(jumpFloat, animated: false)
        jumpLabel.text = "\(jumpFloat)"

        // gravity
        let gravityValue = settings.valueForKey("gravity factor")
        var gravityFloat = Float(GRAVITY_FACTOR)
        if (gravityValue != nil) {
            gravityFloat = gravityValue as! Float
        }
        gravitySlider.setValue(gravityFloat, animated: false)
        gravityLabel.text = "\(gravityFloat)"

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let settings = NSUserDefaults.standardUserDefaults()
        settings.setValue(textField.text, forKey: "ipaddress")
        textField.resignFirstResponder()
        return true
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        let steppedValue = round(handicapSlider.value / sliderStep) * sliderStep
        handicapLabel.text = "\(steppedValue)"
        handicapSlider.value = steppedValue
        let settings = NSUserDefaults.standardUserDefaults()
        settings.setValue(steppedValue, forKey: "handicap")
    }

    @IBAction func movementValueChanged(sender: AnyObject) {
        let steppedValue = round(movementSlider.value / sliderStep) * sliderStep
        movementLabel.text = "\(steppedValue)"
        movementSlider.value = steppedValue
        let settings = NSUserDefaults.standardUserDefaults()
        settings.setValue(steppedValue, forKey: "movement threshold")
    }
    @IBAction func jumpValueChanged(sender: AnyObject) {
        let steppedValue = round(jumpSlider.value / sliderStep) * sliderStep
        jumpLabel.text = "\(steppedValue)"
        jumpSlider.value = steppedValue
        let settings = NSUserDefaults.standardUserDefaults()
        settings.setValue(steppedValue, forKey: "jump threshold")
    }

    @IBAction func gravityValueChanged(sender: AnyObject) {
        let steppedValue = round(gravitySlider.value / 0.5) * 0.5
        gravityLabel.text = "\(steppedValue)"
        gravitySlider.value = steppedValue
        let settings = NSUserDefaults.standardUserDefaults()
        settings.setValue(steppedValue, forKey: "gravity factor")
    }

}