//
//  ParameterViewController.swift
//  BlocNoteTP1
//
//  Created by Loic Vaille on 28/09/2014.
//  Copyright (c) 2014 hydrog3n. All rights reserved.
//

import UIKit

class ParameterViewController: UIViewController, UIAlertViewDelegate {
    // rouge, bleu, orange jaune
    @IBOutlet weak var controlColor: UISegmentedControl!
    @IBAction func changeColor(sender: UISegmentedControl) {
        
        switch controlColor.selectedSegmentIndex
            {
        case 0:
            saveSetting("rouge", key: "blocColor")
        case 1:
            saveSetting("blue", key: "blocColor")
        case 2:
            saveSetting("orange", key: "blocColor")
        case 3:
            saveSetting("jaune", key: "blocColor")
        default:
            break;
        }
    }
    
    @IBAction func clear(sender: AnyObject) {
        let alert = UIAlertController(title: "Supprimer ?", message: "La suppression est définitive", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Annuler", style: .Cancel) { (action) in
            
        }
        alert.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            NSUserDefaults.standardUserDefaults().setObject("", forKey: "note")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        alert.addAction(OKAction)
        
        self.presentViewController(alert, animated: true) {
        }
    }
    func saveSetting(value:NSString, key:NSString) {
        let reglageUtilisateur =  NSUserDefaults.standardUserDefaults()
        reglageUtilisateur.setObject(value, forKey: key)
        reglageUtilisateur.synchronize()
    }
    
//    @IBOutlet weak var autoCorrection: UISwitch!
     
    
    
    override func viewWillAppear(animated: Bool) {
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("blocColor") as? NSString {
            switch color {
            case "rouge":
                controlColor.selectedSegmentIndex = 0
            case "blue":
                controlColor.selectedSegmentIndex = 1
            case "orange":
                controlColor.selectedSegmentIndex = 2
            case "jaune":
                controlColor.selectedSegmentIndex = 3
            default:
                controlColor.selectedSegmentIndex = -1
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

//        autoCorrection.addTarget(self, action: Selector("switchCorrection:"), forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
