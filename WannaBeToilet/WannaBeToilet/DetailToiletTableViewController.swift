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

    let postskey : [String] = ["PUBLFACLT_DIV_NM", "PBCTLT_PLC_NM", "REFINE_ROADNM_ADDR", "REFINE_LOTNO_ADDR", "MALE_FEMALE_TOILET_YN", "MALE_WTRCLS_CNT", "MALE_UIL_CNT", "MALE_DSPSN_WTRCLS_CNT", "MALE_DSPSN_UIL_CNT", "MALE_CHILDUSE_WTRCLS_CNT", "MALE_CHILDUSE_UIL_CNT", "FEMALE_WTRCLS_CNT", "FEMALE_DSPSN_WTRCLS_CNT", "FEMALE_CHILDUSE_WTRCLS_CNT", "MANAGE_INST_NM", "MANAGE_INST_TELNO", "OPEN_TM_INFO", "INSTL_YY", "DATA_STD_DE", "SIGUN_NM", "REFINE_ZIP_CD"]

    //var posts : [String] = ["","","","","","","","","","","","","","","","","","","","",""]
    var posts = NSMutableArray()
    var saveposts = NSMutableArray()
    
    var element = NSString()
    var elements = NSMutableDictionary()
    
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
    var selectedname : String?
    
    
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        detailTableView!.reloadData()
        //print(selectedname!)
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row")
        {
            //posts = ["","","","","","","","","","","","","","","","","","","","",""]
            posts = NSMutableArray()
            
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
    var count = 0
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row") {
                
            //print(count)
            
            if !pub.isEqual(nil) {
                elements.setObject(pub, forKey: "PUBLFACLT_DIV_NM" as NSCopying)
                posts.add(elements)
            }
            if !name.isEqual(nil) {
                elements.setObject(name, forKey: "PBCTLT_PLC_NM" as NSCopying)
                posts.add(elements)
            }
            if !roadaddr.isEqual(nil) {
                elements.setObject(roadaddr, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
                posts.add(elements)
            }
            if !lotnoaddr.isEqual(nil) {
                elements.setObject(lotnoaddr, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
                posts.add(elements)
            }
            if !malfmal.isEqual(nil) {
                elements.setObject(malfmal, forKey: "MALE_FEMALE_TOILET_YN" as NSCopying)
                posts.add(elements)
            }
            if !mwtr.isEqual(nil) {
                elements.setObject(mwtr, forKey: "MALE_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !muil.isEqual(nil) {
                elements.setObject(muil, forKey: "MALE_UIL_CNT" as NSCopying)
                posts.add(elements)
            }
            if !mdspwtr.isEqual(nil) {
                elements.setObject(mdspwtr, forKey: "MALE_DSPSN_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !mdspuil.isEqual(nil) {
                elements.setObject(mdspuil, forKey: "MALE_DSPSN_UIL_CNT" as NSCopying)
                posts.add(elements)
            }
            if !mchdwrt.isEqual(nil) {
                elements.setObject(mchdwrt, forKey: "MALE_CHILDUSE_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !mchduil.isEqual(nil) {
                elements.setObject(mchduil, forKey: "MALE_CHILDUSE_UIL_CNT" as NSCopying)
                posts.add(elements)
            }
            if !fwtr.isEqual(nil) {
                elements.setObject(fwtr, forKey: "FEMALE_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !fdspwtr.isEqual(nil) {
                elements.setObject(fdspwtr, forKey: "FEMALE_DSPSN_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !fchdwrt.isEqual(nil) {
                elements.setObject(fchdwrt, forKey: "FEMALE_CHILDUSE_WTRCLS_CNT" as NSCopying)
                posts.add(elements)
            }
            if !managename.isEqual(nil) {
                elements.setObject(managename, forKey: "MANAGE_INST_NM" as NSCopying)
                posts.add(elements)
            }
            if !tel.isEqual(nil) {
                elements.setObject(tel, forKey: "MANAGE_INST_TELNO" as NSCopying)
                posts.add(elements)
            }
            if !open.isEqual(nil) {
                elements.setObject(open, forKey: "OPEN_TM_INFO" as NSCopying)
                posts.add(elements)
            }
            if !instlyy.isEqual(nil) {
                elements.setObject(instlyy, forKey: "INSTL_YY" as NSCopying)
                posts.add(elements)
            }
            if !datastd.isEqual(nil) {
                elements.setObject(datastd, forKey: "DATA_STD_DE" as NSCopying)
                posts.add(elements)
            }
            if !sigun.isEqual(nil) {
                elements.setObject(sigun, forKey: "SIGUN_NM" as NSCopying)
                posts.add(elements)
            }
            if !refinezip.isEqual(nil) {
                elements.setObject(refinezip, forKey: "REFINE_ZIP_CD" as NSCopying)
                posts.add(elements)
            }
        
            
            if (posts.object(at: 1) as AnyObject).value(forKey: postskey[1]) as! NSString as String == selectedname{
                count += 1
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
        //print(posts.count)
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToiletCell")!
        if(cell.isEqual(NSNull.self)) {
            cell = Bundle.main.loadNibNamed("ToiletCell", owner: self, options: nil)?[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = postsname[indexPath.row]
        //cell.detailTextLabel?.text = posts[indexPath.row] as! String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: postskey[indexPath.row]) as! NSString as String
        
        print(cell)
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
