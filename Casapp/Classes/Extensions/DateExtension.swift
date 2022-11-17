//
//  DateExtension.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

extension Optional where Wrapped == Date {
    var valueOrNow: Date {
        return self ?? Date.now
    }
}
