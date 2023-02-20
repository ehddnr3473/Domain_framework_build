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

struct ConcreteTravelPlanUploadUseCase: TravelPlanUploadUseCase {
    private let repository: AbstractTravelPlanRepository
    
    init(_ repository: AbstractTravelPlanRepository) {
        self.repository = repository
    }
    
    public func execute(at index: Int, travelPlan: TravelPlan) async throws {
        try await repository.upload(at: index, entity: travelPlan)
    }
}
