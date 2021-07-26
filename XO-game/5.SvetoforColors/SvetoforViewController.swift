//
//  SvetoforViewController.swift
//  XO-game
//
//  Created by Maksim on 25.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation
import UIKit


public enum Colr {
    case red, yellow, green
    
    var next: Colr {
        switch self {
        case .red:
            return .yellow
        case .yellow:
            return .green
        case .green:
            return .red
        }
    }
}

//Base Light State
protocol LightState: class {
    var colorOfLight: Colr { get }
    func lightOn()
    func otherLightOff()
}

//ConcreteStateA
class RedColorLight: LightState {
    var colorOfLight: Colr = .red
    weak var svetoforVC: SvetoforColorsVC?
    
    init(svetoforVC: SvetoforColorsVC ) {
        self.svetoforVC = svetoforVC
        print("RedColorLight init")
        sleep(3)
        lightOn()
        otherLightOff()
    }
    
    func lightOn() {
        print("LightOn")
        svetoforVC?.redCircleView.isHidden = false
    }
    func otherLightOff() {
        print("LightOff")
        svetoforVC?.yellowCircleView.isHidden = true
        svetoforVC?.greenCircleView.isHidden = true
    }
}
//ConcreteStateB
class YellowColorLight: LightState {
    var colorOfLight: Colr = .yellow
    weak var svetoforVC: SvetoforColorsVC?
    
    init(svetoforVC: SvetoforColorsVC ) {
        self.svetoforVC = svetoforVC
        print("YellowColorLight init")
        sleep(3)
        lightOn()
        otherLightOff()
    }
    
    func lightOn() {
        svetoforVC?.yellowCircleView.isHidden = false
    }
    func otherLightOff() {
        svetoforVC?.redCircleView.isHidden = true
        svetoforVC?.greenCircleView.isHidden = true
    }
}
//ConcreteStateC
class GreenColorLight: LightState {
    var colorOfLight: Colr = .green
    weak var svetoforVC: SvetoforColorsVC?
    
    init(svetoforVC: SvetoforColorsVC ) {
        self.svetoforVC = svetoforVC
        print("GreenColorLight init")
        sleep(3)
        lightOn()
        otherLightOff()
    }
    
    func lightOn() {
        svetoforVC?.greenCircleView.isHidden = false
    }
    func otherLightOff() {
        svetoforVC?.yellowCircleView.isHidden = true
        svetoforVC?.redCircleView.isHidden = true
    }
}

//Context
class Svetofor {
    var colorLight: Colr {
        didSet{
            print("svetofor colorLight is - ", colorLight)
        }
    }
    var lightState: LightState
    
    weak var svetoforViewController: SvetoforColorsVC?

    init(lightState: LightState, viewController: SvetoforColorsVC) {
        self.svetoforViewController = viewController
        self.lightState = lightState
        self.colorLight = lightState.colorOfLight
        print("svetofor init")
    }
    deinit {
        print("svetofor deinit")
    }
    
    func changeColorLight(turnOn clrLight: Colr ){
        guard let vc = svetoforViewController else {
            print("SvetoforColorsVC - not initialized")
            return
        }
        switch clrLight {
        case .red:
            lightState = RedColorLight(svetoforVC: vc)
            print("red - do")
        case .yellow:
            lightState = YellowColorLight(svetoforVC: vc)
            print("yellow - do")
        case .green:
            lightState = GreenColorLight(svetoforVC: vc)
            print("green - do")
        }
    
        self.colorLight = colorLight.next
        print("colorLight", self.colorLight)
        svetoforViewController?.colorLight = self.colorLight
    }
}
 


class SvetoforColorsVC: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redCircleView: UIImageView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var yellowCircleView: UIImageView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var greenCircleView: UIImageView!
    
    var colorState: LightState?
    var svetofor: Svetofor?
    var colorLight: Colr? {
        didSet{
            sleep(3)
            print("colorLight didSet - ", colorLight?.hashValue)
            svetofor?.colorLight = colorLight ?? .red
            svetofor?.changeColorLight(turnOn: colorLight ?? .red)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
                redView.layer.borderWidth = 3
                redView.layer.borderColor = UIColor.darkGray.cgColor
                redView.layer.cornerRadius = redView.layer.bounds.size.width/2
        
                yellowView.layer.borderWidth = 3
                yellowView.layer.borderColor = UIColor.darkGray.cgColor
                yellowView.layer.cornerRadius = yellowView.layer.bounds.size.width/2
        
                greenView.layer.borderWidth = 3
                greenView.layer.borderColor = UIColor.darkGray.cgColor
                greenView.layer.cornerRadius = greenView.layer.bounds.size.width/2
        
        print("Loaded")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        colorState = RedColorLight(svetoforVC: self)
        svetofor = Svetofor(lightState: colorState!, viewController: self)
        sleep(3)
        self.colorLight = .yellow
        print("Appeared")
    }

    
}

