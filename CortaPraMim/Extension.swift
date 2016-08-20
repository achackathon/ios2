//
//  Extension.swift
//  CortaPraMim
//
//  Created by Fransber Assuncao on 20/08/16.
//  Copyright © 2016 Team12. All rights reserved.
//

import Foundation


extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}