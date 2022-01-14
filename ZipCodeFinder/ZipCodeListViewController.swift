//
//  ZipCodeListViewController.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/11/22.
//

import UIKit
import RxSwift
import SwiftyJSON
import Alamofire

class ZipCodeListViewController: UITableViewController {

    let disposeBag = DisposeBag()

    var zip: String?
    var distance: String?

    var zipcodeService: ZipCodeService?

    private var zipcodeList: [ZipCode]?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("zip : \(zip ?? "not set")")
        print("distance : \(distance ?? "not set")")

        zipcodeList = [] //prepareData()


        getData(zip: "30075", distance: "60")
    }

    private func getData(zip: String, distance: String) {

        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        zipcodeService?.findZipCode(zip: zip, distance: distance)
                .subscribe { (event) in
                    do {
                        sleep(10)
                    }
                    switch event {
                    case .error(let error):
                        print("got error")
                        print(error)
                    case .success(let res):
                        print("got success")
                        switch res {
                        case .success(let arr):
                            print(arr)
                            self.zipcodeList = arr
                        case .failure(let err):
                            print(err)
                        }
                        DispatchQueue.main.async {
                            child.willMove(toParent: nil)
                            child.view.removeFromSuperview()
                            child.removeFromParent()

                            self.tableView.reloadData()
                        }
                    }
                }.disposed(by: disposeBag)

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
                              }
                          ]
                      }
                      """


        if let dataFromString = jsonStr.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)

            let foo = RootClass.init(fromJson: json)
            return foo.zipCodes
        } else {
            return []
        }
    }

}

extension ZipCodeListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        zipcodeList!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ZipCodeListCell else {
            fatalError("Boom")
        }
        let res = zipcodeList![indexPath.row]
        cell.labelZip.text = res.zipCode
        cell.labelCity.text = res.city
        cell.labelState.text = res.state
        cell.labelDistance.text = res.distance.description
        return cell
    }
}

