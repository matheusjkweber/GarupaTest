//
//  NSObject+Ext.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
