//
//  TravelPlanDeleteUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol TravelPlanDeleteUseCase {
    func execute(at index: Int) async throws
}

struct ConcreteTravelPlanDeleteUseCase: TravelPlanDeleteUseCase {
    private let repository: AbstractTravelPlanRepository
    
    init(_ repository: AbstractTravelPlanRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
