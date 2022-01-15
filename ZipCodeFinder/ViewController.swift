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
import SwiftValidator
import SwiftyBeaver

class ViewController: UIViewController {
    
    static var statCtx = String(reflecting: self)
    let instCtx = String(reflecting: self)
    
    var band: Band?
    var zipcodeService: ZipCodeService?
    
    let disposeBag = DisposeBag()
    
    let validator = Validator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupValidator()
        

    }

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var zipCodeText: UITextField!
    @IBOutlet weak var labelZipError: UILabel!
    @IBOutlet weak var labelDistanceError: UILabel!

    private func setupValidator() {
        labelZipError.text = ""
        labelDistanceError.text = ""
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""

            if let textField = validationRule.field as? UITextField {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            } else if let textField = validationRule.field as? UITextView {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            }
        }, error:{ (validationError) -> Void in
            log.error(self.instCtx, "error in setup validator")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
            if let textField = validationError.field as? UITextField {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            } else if let textField = validationError.field as? UITextView {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            }
        })



        validator.registerField(zipCodeText, errorLabel: labelZipError,
                rules: [RequiredRule(),
                        MinLengthRule(length: 5, message: "5 digit zip only"),
                        MaxLengthRule(length: 5, message: "5 digit zip only"),
                        NumericTextRule()
                ])
        validator.registerField(distance, errorLabel: labelDistanceError,
                rules: [RequiredRule(), NumericTextRule(), TextIntegerMinAndMaxRule(min: 1, max: 500)])
    }

    @IBAction func onFindNearbyZips(_ sender: Any) {
        
        validator.validate {(errors:[(Validatable, ValidationError)]) in
            
            if errors.count > 0 {
                log.debug(instCtx, "Validation failed")
            }else {
                log.debug(instCtx, "Validation Success!")
                performSegue(withIdentifier: "navigateToList", sender: nil)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
                    log.error(self.instCtx, "got error \(error)")
                case .success(let res):
                    log.debug(self.instCtx,"findZipCode Result : \(res)")
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

