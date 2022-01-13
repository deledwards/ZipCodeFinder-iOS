//
//  ViewController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import UIKit
import RxSwift
import SwiftyJSON
//import JGProgressHUD
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
        getData(key: "OD4r62CydEbu3V1eb713Yy4pKCql99X0vodjQlZh5FAW9WfXC4IG4PgI4Wyjrh8J", zip: "30022", distance: "20")
    }
    
    
    
    
    //let queue = DispatchQueue(label: "com.response-queue", qos: .utility, attributes: [.concurrent])
//    Alamofire.request("Some URL", parameters: ["Some": "Param"])
//        .response(
//            queue: queue,
//            responseSerializer: DataRequest.jsonResponseSerializer(),
//            completionHandler: { response in
//                /*
//                   You are now running on the queue you created. So you
//                   can parse the response to model objects or do any
//                   other handling if necessary.
//                */
//                //Then you can return to the main thread
//                DispatchQueue.main.async {
//                }
//            }
//    )

   
    
    private func getData(key: String, zip: String, distance: String) {
//        let url = "https://www.zipcodeapi.com/rest/\(key)/radius.json/\(zip)/\(distance)/km"
        
//        let child = SpinnerViewController()
//
//        addChild(child)
//        child.view.frame = view.frame
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
        
//        AF.request(url)
//            .responseString(queue: queue, completionHandler: { resp in
////                print(resp.result)
//
//                if let prettyStr = resp.data?.prettyString {
////                    print(prettyStr)
//                    DispatchQueue.main.async {
//                        self.longText.text = prettyStr as String
//                        
//                        child.willMove(toParent: nil)
//                        child.view.removeFromSuperview()
//                        child.removeFromParent()
//                    }
//                }
//
//                let json = JSON(resp.data as Any)
//                print(json.stringValue)
//                let foo = RootClass.init(fromJson: json)
//                print(foo.zipCodes[0].city as Any)
//            })
        
        //
        
        zipcodeService?.findZipCode(key: key, zip: zip, distance: distance)
            .subscribe { (event) in
                switch event {
                case .next(let res):
                    print("got next")
                    print(res)
                case .error(let error):
                    print("got error")
                    print(error)
                case .completed:
                    print("completed")
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

