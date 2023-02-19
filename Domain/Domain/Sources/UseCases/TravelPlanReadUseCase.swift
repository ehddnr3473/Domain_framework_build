//
//  TravelPlanReadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol TravelPlanReadUseCase {
    func execute() async throws -> [TravelPlan]
}

struct ConcreteTravelPlanReadUseCase<Repository: AbstractRepository>: TravelPlanReadUseCase where Repository.T == TravelPlan {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute() async throws -> [TravelPlan] {
        try await repository.read()
    }
}
