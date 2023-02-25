//
//  Plan.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import CoreLocation

public struct Plan {
    public let title: String
    public let description: String
    public let schedules: [Schedule]
    
    public init(title: String,
         description: String,
         schedules: [Schedule]) {
        self.title = title
        self.description = description
        self.schedules = schedules
    }
}

extension Plan: Equatable {
    public static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.schedules == rhs.schedules
    }
}
