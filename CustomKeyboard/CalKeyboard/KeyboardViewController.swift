//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var returnKeyboardButton: UIButton!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderCounter: UILabel!
    
    var numRepeat: Int!
    
    var keyboardView: UIView!

    @IBAction func changeLabel(sender: UISlider) {
        var currentValue = Int(slider.value)
        sliderCounter.text = "\(currentValue)"
        numRepeat = currentValue
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    @IBAction func printSpace(sender: UIButton) {
        textDocumentProxy.insertText(" ")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    @IBAction func printLol(sender: UIButton) {
        var proxy = textDocumentProxy
        for index in 1...numRepeat{
            proxy.insertText("lol")
        }
    }
    
    @IBAction func printHi(sender: UIButton) {
        var proxy = textDocumentProxy
        for index in 1...numRepeat{
            proxy.insertText("Hi!")
        }
    }
    
    @IBAction func del(sender: UIButton) {
        var proxy = textDocumentProxy
        proxy.deleteBackward()
    }

    @IBAction func ret(sender: UIButton) {
        var proxy = textDocumentProxy
        proxy.insertText("\n")
    }
    
    
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
    }
}
