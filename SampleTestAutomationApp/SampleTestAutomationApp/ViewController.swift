//
//  ViewController.swift
//  SampleTestAutomationApp
//
//  Created by Soneji, Ankit on 10/23/18.
//  Copyright © 2018 Soneji, Ankit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleTestAutomationLabel.accessibilityIdentifier = "sampleTestAutomationLabel"
        sendMessageLabel.accessibilityIdentifier = "sendMessageLabel";
        sendMessageTextField.accessibilityIdentifier = "sendMessageTextField";
        receivedMessageLabel.accessibilityIdentifier = "receivedMessageLabel";
        receivedMessageTextField.accessibilityIdentifier = "receivedMessageTextField";
        
        sendMessageButton.accessibilityIdentifier = "sendMessageButton";
        clearMessageButton.accessibilityIdentifier = "clearMessageButton";
        
        receivedMessageTextField.isUserInteractionEnabled = false;
    }

    @IBOutlet weak var sampleTestAutomationLabel: UILabel!
    @IBOutlet weak var sendMessageLabel: UILabel!
    @IBOutlet weak var sendMessageTextField: UITextField!

    @IBOutlet weak var receivedMessageLabel: UILabel!
    @IBOutlet weak var receivedMessageTextField: UITextField!

    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var clearMessageButton: UIButton!
    
    @IBAction func sendMessageButtonAction(_ sender: UIButton) {
        receivedMessageTextField.text = sendMessageTextField.text
    }
    
    @IBAction func clearMessageButtonAction(_ sender: UIButton) {
        sendMessageTextField.text = ""
        receivedMessageTextField.text = ""
    }
}

