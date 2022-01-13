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
    func findZipCode(key: String, zip: String, distance: String) -> Observable<RestResult<Array<ZipCode>>>
}

struct ZipCodeServiceImpl : ZipCodeService {
    
    let queue = DispatchQueue(label: "com.response-queue", qos: .utility, attributes: [.concurrent])
    
    
    func findZipCode(key: String, zip: String, distance: String) -> Observable<RestResult<Array<ZipCode>>> {
        
        let url = "https://www.zipcodeapi.com/rest/\(key)/radius.json/\(zip)/\(distance)/km"
        
        //Single<RestResult<Array<ZipCode>>>
        
        return Observable<RestResult<Array<ZipCode>>>.create { (observer) -> Disposable in
            
            AF.request(url)
                .responseString(queue: queue, completionHandler: { resp in

                    //var statusCode = resp.response?.statusCode
                    if let error = resp.error?.errorDescription {
                        observer.on(.next(.failure("err: \(error)")))
                        //observer.on(.error(error))
                        return
                    }
                    
                    let json = JSON(resp.data as Any)
                    print(json.stringValue)
                    let foo = RootClass.init(fromJson: json)
//                    print(foo.zipCodes[0].city as Any)
                    
                    observer.on(.next(.success(foo.zipCodes)))
                    observer.on(.completed)
                                
                })
            
            return Disposables.create()
        }
        
       
    }
    
    
}


enum RestResult<T> {
    case success(T)
    case failure(String)
}
