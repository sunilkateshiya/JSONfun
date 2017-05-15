//
//  ViewController.swift
//  JSON fun
//
//  Created by iFlame on 5/15/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            if error != nil
            {
                print("ERROR")
            }
            else
            {
                if let contrnt = data
                {
                    do{
                        let myJson = try JSONSerialization.jsonObject(with: contrnt, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let rates = myJson["rates"] as?  NSDictionary
                        {
                            if let curruncy = rates["NOK"]
                            {
                                print(curruncy)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }


}

