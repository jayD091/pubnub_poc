//
//  ViewController.swift
//  PubnubPoc
//
//  Created by Theonetech on 28/08/22.
//

import UIKit
import PubNub

class ViewController: UIViewController {
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var labelResultValue: UILabel!

    var pubNub: PubNub?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pubNub = PubNubManager.configPubNub()
        
    }

    func sendMessage(text: String) {
        guard let pubNub = pubNub else { return }
        PubNubManager.sendMessageToChannel(pubNub: pubNub, message: "This is my first realtime message!")
    }
    
    @IBAction func buttonSendAction(_ sender: UIButton) {
        sendMessage(text: txtMessage.text ?? "This is my first realtime message!")
        txtMessage.text = ""
    }
    
    @IBAction func buttonSyncAction(_ sender: UIButton) {
        guard let pubNub = pubNub else { return }
        PubNubManager.subscribeChannel(pubNub: pubNub)
                
    }
    
}

