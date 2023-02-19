//
//  TravelPlanUploadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol TravelPlanUploadUseCase {
    func execute(at index: Int, travelPlan: TravelPlan) async throws
}

struct ConcreteTravelPlanUploadUseCase<Repository: AbstractRepository>: TravelPlanUploadUseCase where Repository.T == TravelPlan {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    public func execute(at index: Int, travelPlan: TravelPlan) async throws {
        try await repository.upload(at: index, entity: travelPlan)
    }
}
