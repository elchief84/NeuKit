//
//  ButtonViewController.swift
//  NeuKit_Example
//
//  Created by Vincenzo Romano on 09/06/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet var disableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPressButton(_ sender: Any) {
        disableButton.isEnabled = !disableButton.isEnabled;
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
