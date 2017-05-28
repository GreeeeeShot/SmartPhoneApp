//
//  CityViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 5. 26..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit

class CityViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerDataSource = ["수원시","성남시","의정부시","안양시","부천시","광명시","평택시","동두천시","안산시","고양시","과천시","구리시","남양주시","오산시","시흥시","군포시","의왕시","하남시","용인시","파주시","이천시","안성시","김포시","화성시","광주시","양주시","포천시","여주시","연천군","가평군","양평군"]

    
    var url : String = "http://openapi.gg.go.kr/Publtolt?KEY=c3599d84eb594408b1735412f90f7fdb&pSize=1000&SIGUN_CD="
    
    
    var sgguCd : String = "41110"//디폴트시구코드 = 광진구
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
            sgguCd = "41110"
        } else if row == 1{
            sgguCd = "41130"
        } else if row == 2{
            sgguCd = "41150"
        } else if row == 3{
            sgguCd = "41170"
        } else if row == 4{
            sgguCd = "41190"
        } else if row == 5{
            sgguCd = "41210"
        } else if row == 6{
            sgguCd = "41220"
        } else if row == 7{
            sgguCd = "41250"
        } else if row == 8{
            sgguCd = "41270"
        } else if row == 9{
            sgguCd = "41280"
        } else if row == 10{
            sgguCd = "41290"
        } else if row == 11{
            sgguCd = "41310"
        } else if row == 12{
            sgguCd = "41360"
        } else if row == 13{
            sgguCd = "41370"
        } else if row == 14{
            sgguCd = "41390"
        } else if row == 15{
            sgguCd = "41410"
        } else if row == 16{
            sgguCd = "41430"
        } else if row == 17{
            sgguCd = "41450"
        } else if row == 18{
            sgguCd = "41460"
        } else if row == 19{
            sgguCd = "41480"
        } else if row == 20{
            sgguCd = "41500"
        } else if row == 21{
            sgguCd = "41550"
        } else if row == 22{
            sgguCd = "41570"
        } else if row == 23{
            sgguCd = "41590"
        } else if row == 24{
            sgguCd = "41610"
        } else if row == 25{
            sgguCd = "41630"
        } else if row == 26{
            sgguCd = "41650"
        } else if row == 27{
            sgguCd = "41670"
        } else if row == 28{
            sgguCd = "41800"
        } else if row == 29{
            sgguCd = "41820"
        } else {
            sgguCd = "41830"
        }
        //url = url + sgguCd
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        if segue.identifier == "segueToTableView"{
            if let navController = segue.destination as? UINavigationController {
                if let toiletTableViewController = navController.topViewController as? ToiletTableViewController {
                    toiletTableViewController.url = url + sgguCd
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */

}
