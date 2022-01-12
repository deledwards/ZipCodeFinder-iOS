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
        defaultContainer.storyboardInitCompleted(ViewController.self) { resolver, controller in
            
            controller.band = resolver ~> Band.self
        
        }
    }
}

