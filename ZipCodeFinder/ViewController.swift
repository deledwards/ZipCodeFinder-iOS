//
//  ViewController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import Foundation
import UIKit
import RxSwift
import SwiftyJSON
import Alamofire
//import SwiftValidator

class ViewController: UIViewController {
    
    var band: Band?
    var zipcodeService: ZipCodeService?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var zipCodeText: UITextField!
    
    @IBAction func onFindNearbyZips(_ sender: Any) {
        

        performSegue(withIdentifier: "navigateToList", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare segue")
        if(segue.identifier == "navigateToList"){
            if let nextViewController = segue.destination as? ZipCodeListViewController {
                nextViewController.zip = zipCodeText.text
                nextViewController.distance = distance.text
            }
        }
    }
    
    
    private func getData(zip: String, distance: String) {
        
        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        zipcodeService?.findZipCode(zip: zip, distance: distance)
            .subscribe { (event) in
                switch event {
                case .error(let error):
                    print("got error")
                    print(error)
                case .success(let res):
                    print("got success")
                    print(res)
                    DispatchQueue.main.async {
                        child.willMove(toParent: nil)
                        child.view.removeFromSuperview()
                        child.removeFromParent()
                    }
                }
            }.disposed(by: disposeBag)
        
    }
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

extension Data {
    var prettyString: NSString? {
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? nil
    }
}


class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

