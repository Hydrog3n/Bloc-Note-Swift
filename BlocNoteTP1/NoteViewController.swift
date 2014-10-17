//
//  ViewController.swift
//  BlocNoteTP1
//
//  Created by Loic Vaille on 04/09/2014.
//  Copyright (c) 2014 hydrog3n. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var takeNote: UITextField!
    @IBOutlet weak var noteView: UITextView!
    
    
    @IBAction func clearNote(sender: UIButton) {
        self.noteView.text = ""
        savePerm(noteView.text, key:"note")
        self.takeNote.text = ""
        
    }
    
    @IBAction func saveNote(sender: UIButton) {
        addNote()
    }
    override func viewWillAppear(animated: Bool) {
        // Chargement de la couleur
        let reglagesUtilisateur = NSUserDefaults.standardUserDefaults()
        if let color = reglagesUtilisateur.valueForKey("blocColor") as? NSString {
            selectColor(color)
        }
        // Reccuperration de la sauvegarde de la note
        if let note = reglagesUtilisateur.valueForKey("note") as? NSString {
            noteView.text = note
        }
    }
    override func viewDidLoad() {
        
        //switchCorrection()

        let colorBack = UIColor(red:0.941, green:0.914, blue:0.263, alpha:1)
        self.noteView.backgroundColor = colorBack
        
        // Delegation
        takeNote.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ////
    // param @object, @string
    // sauvegarde en cache d'objet voulu
    ////
    func savePerm (saveObject: AnyObject?, key:String) {
        NSUserDefaults.standardUserDefaults().setObject(saveObject, forKey:key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    //reccup des objet dans le dico
    func backObject (var Object: AnyObject?, key:String) {
        
    }
    // ajout d'une note
    func addNote() {
        let chaineEmpty:String = "Le champ est vide..."
        if !takeNote.text.isEmpty && takeNote.text != chaineEmpty {
            noteView.text = noteView.text + "- " + takeNote.text + "\n"
            takeNote.text = ""
            savePerm(noteView.text, key:"note")
        }
        else {
            takeNote.textColor = UIColor.grayColor()
            takeNote.text = chaineEmpty
        }
        takeNote.resignFirstResponder()
    }
    // ajout de la note a l'appuie de entrer
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        addNote()
        return true
    }
    
    // effacer le champs au clic
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.text = ""
        textField.textColor = UIColor.blackColor()
        return true
    }
    func textFieldShouldEndEditing(text: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
    
    func selectColor(color:NSString) {
        switch (color) {
            case "blue":
                noteView.backgroundColor = UIColor.blueColor()
            case "rouge":
                 noteView.backgroundColor = UIColor.redColor()
            case "orange":
                 noteView.backgroundColor = UIColor.orangeColor()
            case "jaune":
                 noteView.backgroundColor = UIColor.yellowColor()
        default:
            break;
        }
    }
}

