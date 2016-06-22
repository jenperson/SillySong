//
//  ViewController.swift
//  Silly Song
//
//  Created by Jennifer Person on 4/27/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Set the lyrics and name field to empty when typing name
    @IBAction func reset(sender: AnyObject) {
        nameField.text  = ""
        lyricsView.text = ""
    }
    
    // Execute silly name and display
    @IBAction func displayLyrics(sender: AnyObject) {
        if nameField.text != ""{
            lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
        } else {
            lyricsView.text = ""
        }
    }
    
}

// Function provided by Udacity
func shortNameFromName(fullName: String) -> String {
    // Create lowercase name
    let lowercaseName = fullName.lowercaseString
    let vowelSet = NSCharacterSet(charactersInString: "aeiouö")
    
    if let firstVowelRange = lowercaseName.rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch) {
        return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
    }
    
    return lowercaseName
}

// Function provided by Udacity
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    // Create a truncated version of name
    let shortName = shortNameFromName(fullName)
    
    // Add full name to given lyrics
    var newLyrics = lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
    // Add shortened name to given lyrics
    newLyrics = newLyrics.stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    // Return the modified lyrics
    return newLyrics
}
// Template for silly song
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


