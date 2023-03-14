//
//  Plan.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import CoreLocation

public struct Plan {
    public typealias Identifier = String
    public let title: Identifier
    public let description: String
    public let schedules: [Schedule]
    public let updatedDate: Date
    
    public init(title: Identifier,
                description: String,
                schedules: [Schedule],
                updatedDate: Date) {
        self.title = title
        self.description = description
        self.schedules = schedules
        self.updatedDate = updatedDate
    }
}

extension Plan: Equatable {
    public static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.schedules == rhs.schedules
    }
}
