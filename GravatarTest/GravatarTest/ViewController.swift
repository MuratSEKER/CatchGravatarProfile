//
//  ViewController.swift
//  GravatarTest
//
//  Created by mslab on 25.12.2016.
//  Copyright © 2016 mslab. All rights reserved.
//

import UIKit
import CryptoKit


class ViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var txtMail: UITextField!
    @IBAction func fncGetImage(_ sender: UIButton) {
        
        //let message = "benmuratseker@hotmail.com".data(using: .utf8)!
        let message = txtMail.text?.data(using: .utf8)
        let hash = message?.digest(using: .md5).map { String(format: "%02x", $0) }.joined()
        
        print("hash:\(hash!)")
        
        let gravatarPath = "https://www.gravatar.com/avatar/\(hash!)?s=100".removingPercentEncoding!
        
        let imageUrl = URL(string: gravatarPath)
        print("gravatarpath:\(gravatarPath)")
        print("imagepath:\(imageUrl)")
        
      
        //let data = try! Data(contentsOf: gravatarPath as! URL)
        
        //print(data)
        let data = try! Data(contentsOf: imageUrl!)
        let image = UIImage(data: data, scale: UIScreen.main.scale)!
        
        profileImage.image = image
        
    
        //1a4f428062415cc699b4de14266e1102
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

