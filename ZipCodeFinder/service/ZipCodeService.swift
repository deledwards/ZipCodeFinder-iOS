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
    func findZipCode(key: String, zip: String, distance: String) -> Single<RestResult<Array<ZipCode>>>
}

struct ZipCodeServiceImpl : ZipCodeService {
    
    let queue = DispatchQueue(label: "com.response-queue", qos: .utility, attributes: [.concurrent])
    
    
    func findZipCode(key: String, zip: String, distance: String) -> Single<RestResult<Array<ZipCode>>> {
        
        let url = "https://www.zipcodeapi.com/rest/\(key)/radius.json/\(zip)/\(distance)/km"
        
        return Single<RestResult<Array<ZipCode>>>.create { single in
            
            AF.request(url)
                .responseString(queue: queue, completionHandler: { resp in

                    if let error = resp.error?.errorDescription {
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
}


enum RestResult<T> {
    case success(T)
    case failure(String)
}
