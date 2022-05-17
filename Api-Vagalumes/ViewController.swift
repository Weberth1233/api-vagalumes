//
//  ViewController.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 17/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cliquei(_ sender: Any) {
        
        let request = AF.request("https://www.vagalume.com.br/news/index.js")
        request.responseJSON{(data) in
            print(data)
        }
    }
}

