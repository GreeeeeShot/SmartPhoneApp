//
//  ViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 5. 22..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var second = 0
    var timer = Timer()

    func timerFunc()
    {
        second += 1
        if (second == 2)
        {
            timer.invalidate()
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.goMain), userInfo: nil, repeats: false)
        }
    }
    
    func goMain()
    {
        self.performSegue(withIdentifier: "mainSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
/*
        if segue.identifier == "segueToMap" {
            if let tapbarController = segue.destination as? TabBarController{
                tapbarController.segueValue = "Map"
            }
        }
        if segue.identifier == "segueToSound" {
            if let tapbarController = segue.destination as? TabBarController{
                tapbarController.segueValue = "Sound"
            }
        }
        if segue.identifier == "segueToCity" {
            if let tapbarController = segue.destination as? TabBarController{
                tapbarController.segueValue = "City"
            }
        }
        if segue.identifier == "segueToSource" {
            if let tapbarController = segue.destination as? TabBarController{
                tapbarController.segueValue = "Source"
            }
        }
        if segue.identifier == "segueToKeyword" {
            if let tapbarController = segue.destination as? TabBarController{
                tapbarController.segueValue = "Keyword"
            }
        }*/
    }

}

