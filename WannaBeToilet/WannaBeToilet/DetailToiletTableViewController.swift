//
//  DetailToiletTableViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 5. 28..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit

class DetailToiletTableViewController: UITableViewController, XMLParserDelegate {

    @IBOutlet var detailTableView: UITableView!
    
    var url : String?
    var parser = XMLParser()
    let postsname : [String] = ["구분","화장실명","소재지도로명주소", "소재지지번주소", "남녀공용화장실여부", "남성용-대변기수", "남성용-소변기수", "남성용-장애인용대변기수","남성용-장애인용소변기수","남성용-어린이용대변기수", "남성용-어린이용소변기수","여성용-대변기수","여성용-장애인용대변기수","여성용-어린이용대변기수","관리기관명","전화번호","개방시간","설치년도","데이터기준일자","시군명","소재지우편번호"]
    
    var posts : [String] = ["","","","","","","","","","","","","","","","","","","","",""]
    
    var element = NSString()
    
    var pub = NSMutableString()
    var name = NSMutableString()
    var roadaddr = NSMutableString()
    var lotnoaddr = NSMutableString()
    var malfmal = NSMutableString()
    var mwtr = NSMutableString()
    var muil = NSMutableString()
    var mdspwtr = NSMutableString()
    var mdspuil = NSMutableString()
    var mchdwrt = NSMutableString()
    var mchduil = NSMutableString()
    var fwtr = NSMutableString()
    var fdspwtr = NSMutableString()
    var fchdwrt = NSMutableString()
    var managename = NSMutableString()
    var tel = NSMutableString()
    var open = NSMutableString()
    var instlyy = NSMutableString()
    var datastd = NSMutableString()
    var sigun = NSMutableString()
    var refinezip = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        detailTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row")
        {
            posts = ["","","","","","","","","","",""]
            
            pub = NSMutableString()
            pub = ""
            name = NSMutableString()
            name = ""
            
            roadaddr = NSMutableString()
            roadaddr = ""
            lotnoaddr = NSMutableString()
            lotnoaddr = ""
            malfmal = NSMutableString()
            malfmal = ""
            mwtr = NSMutableString()
            mwtr = ""
            muil = NSMutableString()
            muil = ""
            mdspwtr = NSMutableString()
            mdspwtr = ""
            mdspuil = NSMutableString()
            mdspuil = ""
            mchdwrt = NSMutableString()
            mchdwrt = ""
            mchduil = NSMutableString()
            mchduil = ""
            fwtr = NSMutableString()
            fwtr = ""
            fdspwtr = NSMutableString()
            fdspwtr = ""
            fchdwrt = NSMutableString()
            fchdwrt = ""
            managename = NSMutableString()
            managename = ""
            tel = NSMutableString()
            tel = ""
            open = NSMutableString()
            open = ""
            instlyy = NSMutableString()
            instlyy = ""
            datastd = NSMutableString()
            datastd = ""
            sigun = NSMutableString()
            sigun = ""
            refinezip = NSMutableString()
            refinezip = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "PUBLFACLT_DIV_NM") {
            pub.append(string)
        }
        else if element.isEqual(to: "PBCTLT_PLC_NM") {
            name.append(string)
        }
        else if element.isEqual(to: "REFINE_ROADNM_ADDR")
        {
            roadaddr.append(string)
        }
        else if element.isEqual(to: "REFINE_LOTNO_ADDR")
        {
            lotnoaddr.append(string)
        }
        else if element.isEqual(to: "MALE_FEMALE_TOILET_YN")
        {
            malfmal.append(string)
        }
        else if element.isEqual(to: "MALE_WTRCLS_CNT")
        {
            mwtr.append(string)
        }
        else if element.isEqual(to: "MALE_UIL_CNT")
        {
            muil.append(string)
        }
        else if element.isEqual(to: "MALE_DSPSN_WTRCLS_CNT")
        {
            mdspwtr.append(string)
        }
        else if element.isEqual(to: "MALE_DSPSN_UIL_CNT")
        {
            mdspuil.append(string)
        }
        else if element.isEqual(to: "MALE_CHILDUSE_WTRCLS_CNT")
        {
            mchdwrt.append(string)
        }
        else if element.isEqual(to: "MALE_CHILDUSE_UIL_CNT")
        {
            mchduil.append(string)
        }
        else if element.isEqual(to: "FEMALE_WTRCLS_CNT") {
            fwtr.append(string)
        }
        else if element.isEqual(to: "FEMALE_DSPSN_WTRCLS_CNT")
        {
            fdspwtr.append(string)
        }
        else if element.isEqual(to: "FEMALE_CHILDUSE_WTRCLS_CNT")
        {
            fchdwrt.append(string)
        }
        else if element.isEqual(to: "MANAGE_INST_NM")
        {
            managename.append(string)
        }
        else if element.isEqual(to: "MANAGE_INST_TELNO")
        {
            tel.append(string)
        }
        else if element.isEqual(to: "OPEN_TM_INFO")
        {
            open.append(string)
        }
        else if element.isEqual(to: "INSTL_YY")
        {
            instlyy.append(string)
        }
        else if element.isEqual(to: "DATA_STD_DE")
        {
            datastd.append(string)
        }
        else if element.isEqual(to: "SIGUN_NM")
        {
            sigun.append(string)
        }
        else if element.isEqual(to: "REFINE_ZIP_CD")
        {
            refinezip.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item") {
            if !pub.isEqual(nil) {
                posts[0] = pub as String
            }
            if !name.isEqual(nil) {
                posts[1] = name as String
            }
            if !roadaddr.isEqual(nil) {
                posts[2] = roadaddr as String
            }
            if !lotnoaddr.isEqual(nil) {
                posts[3] = lotnoaddr as String
            }
            if !malfmal.isEqual(nil) {
                posts[4] = malfmal as String
            }
            if !mwtr.isEqual(nil) {
                posts[5] = mwtr as String
            }
            if !muil.isEqual(nil) {
                posts[6] = muil as String
            }
            if !mdspwtr.isEqual(nil) {
                posts[7] = mdspwtr as String
            }
            if !mdspuil.isEqual(nil) {
                posts[8] = mdspuil as String
            }
            if !mchdwrt.isEqual(nil) {
                posts[9] = mchdwrt as String
            }
            if !mchduil.isEqual(nil) {
                posts[10] = mchduil as String
            }
            if !pub.isEqual(nil) {
                posts[0] = pub as String
            }
            if !name.isEqual(nil) {
                posts[1] = name as String
            }
            if !roadaddr.isEqual(nil) {
                posts[2] = roadaddr as String
            }
            if !fwtr.isEqual(nil) {
                posts[3] = fwtr as String
            }
            if !fdspwtr.isEqual(nil) {
                posts[4] = fdspwtr as String
            }
            if !fchdwrt.isEqual(nil) {
                posts[5] = fchdwrt as String
            }
            if !managename.isEqual(nil) {
                posts[6] = managename as String
            }
            if !tel.isEqual(nil) {
                posts[7] = tel as String
            }
            if !open.isEqual(nil) {
                posts[8] = open as String
            }
            if !instlyy.isEqual(nil) {
                posts[9] = instlyy as String
            }
            if !datastd.isEqual(nil) {
                posts[10] = datastd as String
            }
            if !sigun.isEqual(nil) {
                posts[9] = sigun as String
            }
            if !refinezip.isEqual(nil) {
                posts[10] = refinezip as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToiletCell")!
        if(cell.isEqual(NSNull.self)) {
            cell = Bundle.main.loadNibNamed("ToiletCell", owner: self, options: nil)?[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        
        return cell as UITableViewCell
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
