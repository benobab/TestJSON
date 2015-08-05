//
//  ViewController.swift
//  TestJSON
//
//  Created by Benobab on 05/08/15.
//  Copyright © 2015 Benobab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.getDataByID(123)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataByID(id : Int) {
        let data = self.getData()
        for( var i=0 ; i < data.count ; i++)
        {
            if(Int((((data as NSDictionary)["places"] as! NSArray)[i] as! NSDictionary)["id"] as! Int) == id)
            {
                print("Ici on peut récupérer la data :")
                print(String((((data as NSDictionary)["places"] as! NSArray)[i])))
            }
        }
    }
    
    func getData() -> NSDictionary {
        do{
            let path = NSBundle.mainBundle().pathForResource("test", ofType: "json")
            let jsonData = NSData(contentsOfFile: path!)
            let jsonResult:NSDictionary!  = try NSJSONSerialization.JSONObjectWithData(jsonData! , options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return jsonResult
        } catch let error as NSError {
            print(error)
        }
        
        return NSDictionary()
    }

}

