//
//  ViewController.swift
//  calabrother
//
//  Created by Sander Saelmans on 01/02/2018.
//

import UIKit
import ExternalAccessory

class ViewController: UIViewController, EAAccessoryDelegate {
    
    func accessoryDidDisconnect(_ accessory: EAAccessory) {
        
    }

    func connectedAccessories() -> [EAAccessory] {
        return EAAccessoryManager.shared().connectedAccessories
    }

}

