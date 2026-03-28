//
//  Array+Extensions.swift
//  ImageFeed
//
//  Created by Alfa on 28.03.2026.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
