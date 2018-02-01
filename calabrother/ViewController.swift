//
//  ViewController.swift
//  calabrother
//
//  Created by Sander Saelmans on 01/02/2018.
//

import UIKit
import ExternalAccessory

class ViewController: UIViewController, StreamDelegate {
    let protocol1String = "com.cantusespace.calabrother.p1"
    var activeSession: EASession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activeSession = openSessionForProtocol(protocolType: protocol1String)
    }
    
    // MARK: External Accessory connection setup
    func openSessionForProtocol(protocolType: String) -> EASession? {
        var session: EASession?
        if let accessory = findAccessory(withProtocol: protocol1String) {
            session = setupSession(accessory: accessory, protocolString: protocol1String)
        }
        
        return session
    }
    
    func findAccessory(withProtocol: String) -> EAAccessory? {
        let connectedAccessories = EAAccessoryManager.shared().connectedAccessories
        var desiredAccessory: EAAccessory?
        for accessory in connectedAccessories {
            if accessory.protocolStrings.contains(protocol1String) {
                desiredAccessory = accessory
                break
            }
        }
        
        return desiredAccessory
    }
    
    func setupSession(accessory: EAAccessory, protocolString: String) -> EASession? {
        if let session = EASession.init(accessory: accessory, forProtocol: protocolString) {
            session.inputStream?.delegate = self
            session.inputStream?.schedule(in: .current, forMode: .defaultRunLoopMode)
            session.inputStream?.open()
            
            session.outputStream?.delegate = self
            session.outputStream?.schedule(in: .current, forMode: .defaultRunLoopMode)
            session.outputStream?.open()
            
            return session
        }
        
        return nil
    }
    
    // MARK: Receiving/Sending data
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        // Todo
        NSLog("Yay")
    }

}

