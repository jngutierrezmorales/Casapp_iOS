//
//  BooleanExtension.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import Foundation

extension Optional where Wrapped == Bool {
    var valueOrFalse: Bool {
        return self ?? false
    }
}
