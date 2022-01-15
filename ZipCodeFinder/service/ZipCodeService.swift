//
//  ZipCodeService.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/12/22.
//

import Foundation
import RxSwift
import SwiftyJSON
import Alamofire


protocol ZipCodeService {
    func findZipCode(zip: String, distance: String) -> Single<RestResult<Array<ZipCode>>>
}

struct ZipCodeServiceImpl : ZipCodeService {
    
    let queue = DispatchQueue(label: "com.response-queue", qos: .utility, attributes: [.concurrent])
    
    
    func findZipCode(zip: String, distance: String) -> Single<RestResult<Array<ZipCode>>> {
        print("in real service")
        let url = "https://www.zipcodeapi.com/rest/\(apiKey)/radius.json/\(zip)/\(distance)/km"
        
        return Single<RestResult<Array<ZipCode>>>.create { single in
        
            Alamofire.request(url)
                .responseString(queue: queue, completionHandler: { resp in

                    if let error = resp.error {
                        single(.success(.failure("err: \(error)")))
                        return
                    }
                    
                    switch resp.result {
                    case .failure(let err):
                        print(err)
                        single(.success(.failure(err.localizedDescription)))
                    case .success(let succ):
                        //print(succ)
                        
                        let json = JSON.init(parseJSON: succ)
                        
                        if json["error_code"].exists() {
                            single(.success(.failure(json.stringValue)))
                            
                        } else if json["zip_codes"].exists() {
                            if json["zip_codes"].count > 0 {
                                let parsedJsonObj = RootClass.init(fromJson: json)
                                
                                let withoutSource =  parsedJsonObj.zipCodes.filter { barbaz in
                                    barbaz.zipCode != zip
                                }
                                
                                if withoutSource.count < 1 {
                                    single(.success(.failure("No results")))
                                } else {
                                    single(.success(.success(withoutSource)))
                                }
                            }
                        }
                    }
                })
            
            return Disposables.create()
        }
    }
    
    private var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "apiKey", ofType: "plist") else {
          fatalError("Couldn't find file 'TMDB-Info.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
        }
        return value
      }
    }
}


enum RestResult<T> {
    case success(T)
    case failure(String)
}
