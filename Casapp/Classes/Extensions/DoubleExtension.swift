//
//  DoubleExtension.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

extension Optional where Wrapped == Double {
    var valueOrZero: Double {
        return self ?? 0.0
    }
}
