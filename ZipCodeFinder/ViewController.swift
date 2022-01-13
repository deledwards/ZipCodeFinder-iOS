//
//  ViewController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import UIKit
import RxSwift
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let queue = DispatchQueue(label: "com.response-queue", qos: .utility, attributes: [.concurrent])
    
    var band: Band?
    var zipcodeService: ZipCodeService?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var zipCodeText: UITextField!
    @IBOutlet weak var longText: UITextView!
    
    
    @IBAction func onFindNearbyZips(_ sender: Any) {
        
        print("button was tapped")
        performSegue(withIdentifier: "navigateToList", sender: nil)
    }
    
    @IBAction func buttonFetch(_ sender: Any) {
        
        print("button to fetch \(self.band?.name ?? "unknown")")
        getData(zip: "30022", distance: "20")
    }
    
    private func getData(zip: String, distance: String) {
        
        zipcodeService?.findZipCode(zip: zip, distance: distance)
            .subscribe { (event) in
                switch event {
                case .error(let error):
                    print("got error")
                    print(error)
                case .success(let res):
                    print("got success")
                    print(res)
                }
            }.disposed(by: disposeBag)
        
    }
    
}

extension Data {
    var prettyString: NSString? {
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? nil
    }
}


class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

