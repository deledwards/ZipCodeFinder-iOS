//
//  Band.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/12/22.
//

import Foundation

protocol  Band {

    var name: String { get set }
    
   
}

struct MetalBand: Band {
    var name: String
    
    init(name: String){
        self.name = name
    }

}
