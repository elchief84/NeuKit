//
//  ViewsViewController.swift
//  NeuKit_Example
//
//  Created by Vincenzo Romano on 09/06/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ViewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.view.subviews.forEach { (view) in
            view.setup();
            applyShadowToSubviews(parent: view);
        }
    }
    
    private func applyShadowToSubviews(parent: UIView){
        parent.subviews.forEach { (view) in
            view.setup();
            self.applyShadowToSubviews(parent: view);
        }
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
