//
//  CoordinateRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation

public protocol CoordinateRepository {
    func fetchCoordinate(query: String) async throws -> Coordinate
}
