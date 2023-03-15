//
//  Coordinate.swift
//  Domain
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation

public struct Coordinate {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
