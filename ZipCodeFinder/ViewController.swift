//
//  ViewController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var zipCodeText: UITextField!
    @IBAction func onFindNearbyZips(_ sender: Any) {
        
        print("button was tapped")
        performSegue(withIdentifier: "navigateToList", sender: nil)
    }
}

