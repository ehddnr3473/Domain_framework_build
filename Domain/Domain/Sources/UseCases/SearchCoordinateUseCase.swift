//
//  SearchCoordinateUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation

public protocol SearchCoordinateUseCase {
    func execute(query: String) async throws -> Coordinate
}

public struct DefaultSearchCoordinateUseCase: SearchCoordinateUseCase {
    private let repository: CoordinateRepository
    
    public func execute(query: String) async throws -> Coordinate {
        try await repository.fetchCoordinate(query: query)
    }
}
