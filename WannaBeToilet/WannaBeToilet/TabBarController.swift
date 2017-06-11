//
//  TabBarController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 6. 11..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var segueValue: String? = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    



}
