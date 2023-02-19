//
//  Schedule.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import CoreLocation

/// TravelPlan의 하위 데이터
public struct Schedule {
    public let title: String
    public let description: String
    public let coordinate: CLLocationCoordinate2D
    public let fromDate: Date?
    public let toDate: Date?
    
    public init(title: String,
                description: String,
                coordinate: CLLocationCoordinate2D,
                fromDate: Date?,
                toDate: Date?) {
        self.title = title
        self.description = description
        self.coordinate = coordinate
        self.fromDate = fromDate
        self.toDate = toDate
    }
}

extension Schedule: Equatable {
    public static func == (lhs: Schedule, rhs: Schedule) -> Bool {
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.fromDate == rhs.fromDate &&
        lhs.toDate == rhs.toDate &&
        lhs.coordinate.latitude == rhs.coordinate.latitude &&
        lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}

