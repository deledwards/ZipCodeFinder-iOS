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
import SwiftyBeaver

class ZipCodeListViewController: UITableViewController {

    let disposeBag = DisposeBag()

    var zip: String?
    var distance: String?

    var zipcodeService: ZipCodeService?

    private var zipcodeList: [ZipCode]?

    override func viewDidLoad() {
        super.viewDidLoad()

        log.debug(self,"zip : \(zip ?? "not set")")
        log.debug(self, "distance : \(distance ?? "not set")")

        zipcodeList = [] //prepareData()
        //add guards
        getData(zip: zip!, distance: distance!)
    }

    private func getData(zip: String, distance: String) {

        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        zipcodeService?.findZipCode(zip: zip, distance: distance)
                .subscribe { (event) in
                    var errHappened = false
                    var errMessage = ""
                    switch event {
                    case .error(let error):
                        log.error(self, "got error in zipcode service sub")
                        log.error(self, "err: \(error)")
                        errHappened = true
                        errMessage = error.localizedDescription
                    case .success(let res):
                        log.debug(self, "got success")
                        switch res {
                        case .success(let arr):
                            log.debug(self, " zip code result list : \(arr)")
                            self.zipcodeList = arr
                        case .failure(let err):
                            log.error(self, "err: \(err)")
                            // put an error dialog here
                            errHappened = true
                            errMessage = err
                        }
                        DispatchQueue.main.async {
                            child.willMove(toParent: nil)
                            child.view.removeFromSuperview()
                            child.removeFromParent()

                            self.tableView.reloadData()
                            
                            if errHappened {
                                let alert = UIAlertController(title: "Error", message: errMessage, preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: {(alert) in
                                    self.navigationController?.popViewController(animated: true)
                                }))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }.disposed(by: disposeBag)

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

