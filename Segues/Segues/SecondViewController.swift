//
//  SecondViewController.swift
//  Segues
//
//  Created by Kevin Alonzo on 9/19/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondButton: UIButton!
    
    var textPassedOver : String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = textPassedOver
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
