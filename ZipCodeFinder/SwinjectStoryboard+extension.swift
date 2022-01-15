//
//  SwinjectStoryboard+extension.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/12/22.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    
    @objc class func setup() {
        defaultContainer.autoregister(Band.self) { _ in
            MetalBand(name: "Black Sabbath")
        }
//        defaultContainer.autoregister(ZipCodeService.self) { _ in
//            MockZipCodeServiceImpl()
//        }
        defaultContainer.autoregister(ZipCodeService.self) { _ in
            ZipCodeServiceImpl()
        }
        defaultContainer.storyboardInitCompleted(ViewController.self) { resolver, controller in
            
            controller.band = resolver ~> Band.self
            controller.zipcodeService = resolver ~> ZipCodeService.self
        
        }
        //defaultContainer.storyboardInitCompleted(ZipCodeListController.self, initCompleted: { resolver, controller in controller.zipcodeService = resolver ~> ZipCodeService.self })
        defaultContainer.storyboardInitCompleted(ZipCodeListViewController.self) { resolver, controller in
            controller.zipcodeService = resolver ~> ZipCodeService.self
        }
    }
}

