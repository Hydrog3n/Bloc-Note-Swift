//
//  ShareViewController.swift
//  BlocNoteTP1
//
//  Created by Loic on 13/10/2014.
//  Copyright (c) 2014 hydrog3n. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {


    override func viewDidAppear(animated: Bool) {
        let note = NSUserDefaults.standardUserDefaults().valueForKey("note") as? NSString
        var actNote :String = note!
        actNote = "Ma Note : \n" + actNote
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [actNote], applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)
        activityViewController.completionHandler = {(activityType, completed:Bool) in
            // changement de vue à faire
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
