//
//  Storyboard+Utilities.swift
//  Makestagram
//
//  Created by Sakura Rapolu on 7/11/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard{
    enum MGType: String{
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: MGType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: MGType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else{
            fatalError("couldnt instantiate view controller for \(type.filename) storyboard.")
        }
        return initialViewController
    }
}
