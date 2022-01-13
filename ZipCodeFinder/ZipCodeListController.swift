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
    
    let disposeBag = DisposeBag()
    
    var zip: String?
    var distance: String?
    
    var zipcodeService: ZipCodeService?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        getData(zip: unZip, distance: unDist)
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
