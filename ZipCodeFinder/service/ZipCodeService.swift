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
        
        let url = "https://www.zipcodeapi.com/rest/\(apiKey)/radius.json/\(zip)/\(distance)/km"
        
        return Single<RestResult<Array<ZipCode>>>.create { single in
        
            Alamofire.request(url)
                .responseString(queue: queue, completionHandler: { resp in

                    if let error = resp.error {
                        single(.success(.failure("err: \(error)")))
                        return
                    }
                    
                    let json = JSON(resp.data as Any)
                    print(json.stringValue)
                    let foo = RootClass.init(fromJson: json)
                    single(.success(.success(foo.zipCodes)))
                                
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
