//
//  ZipCodeListController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import UIKit
import RxSwift
import SwiftyJSON
import Alamofire

class ZipCodeListController: UITableViewController {

    static let zipCodeListCell = "ZipCodeListCell"


    
    let disposeBag = DisposeBag()
    
    var zip: String?
    var distance: String?
    
    var zipcodeService: ZipCodeService?

    private var zipcodeList: [ZipCode]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        print("zip : \(zip ?? "not set")")
        print("distance : \(distance ?? "not set")")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        guard let unZip = zip, let unDist = distance else {
            print("do nothing")
            return
        }
        //getData(zip: unZip, distance: unDist)

        zipcodeList = prepareData()

//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.reloadData()


        print(zipcodeList as AnyObject)
    }

    private func prepareData() -> [ZipCode]! {
        let jsonStr = """
                      {
                          "zip_codes": [
                              {
                                  "zip_code": "30092",
                                  "distance": 6.427,
                                  "city": "Norcross",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30026",
                                  "distance": 8.931,
                                  "city": "North Metro",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30029",
                                  "distance": 8.931,
                                  "city": "North Metro",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30095",
                                  "distance": 8.931,
                                  "city": "Duluth",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30098",
                                  "distance": 8.931,
                                  "city": "Duluth",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30099",
                                  "distance": 8.931,
                                  "city": "Duluth",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30097",
                                  "distance": 8.67,
                                  "city": "Duluth",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30076",
                                  "distance": 6.602,
                                  "city": "Roswell",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30022",
                                  "distance": 0,
                                  "city": "Alpharetta",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30023",
                                  "distance": 4.366,
                                  "city": "Alpharetta",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30009",
                                  "distance": 8.134,
                                  "city": "Alpharetta",
                                  "state": "GA"
                              },
                              {
                                  "zip_code": "30005",
                                  "distance": 6.896,
                                  "city": "Alpharetta",
                                  "state": "GA"
                              }
                          ]
                      }
                      """


        if let dataFromString = jsonStr.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)

            let foo = RootClass.init(fromJson: json)
            return foo.zipCodes
        }else {
            return []
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

extension ZipCodeListController {

    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return zipcodeList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.zipCodeListCell, for: indexPath) as? ZipCodeListCell else {
            fatalError("Unable to dequeue ZipCodeListCell")
        }

        let zipcode = zipcodeList?[indexPath.row]
//        cell.cityLabel.text = zipcode?.city
//        cell.stateLabel.text = zipcode?.state
//        cell.distanceLabel.text = zipcode?.distance.description
        cell.zipLabel.text = zipcode?.zipCode

        return cell
    }
}
