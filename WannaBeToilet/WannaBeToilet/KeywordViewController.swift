//
//  KeywordViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 6. 11..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit

class KeywordViewController: UIViewController {

    @IBOutlet weak var keywordTextbar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        if segue.identifier == "segueToKeywordSearch"{
            if let navController = segue.destination as? UINavigationController {
                if let hospitalTableViewController = navController.topViewController as? KeywordSearchTableViewController {
                    hospitalTableViewController.keyword = keywordTextbar.text
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
