//
//  IntExtension.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

extension Optional where Wrapped == Int {
    var valueOrZero: Int {
        return self ?? 0
    }
}
