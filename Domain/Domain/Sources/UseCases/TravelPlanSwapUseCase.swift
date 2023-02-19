//
//  TravelPlanSwapUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public struct TravelPlanSwapBox {
    public let source: Int
    public let destination: Int
    public let sourceTravelPlan: TravelPlan
    public let destinationTravelPlan: TravelPlan
    
    public init(source: Int,
                destination: Int,
                sourceTravelPlan: TravelPlan,
                destinationTravelPlan: TravelPlan) {
        self.source = source
        self.destination = destination
        self.sourceTravelPlan = sourceTravelPlan
        self.destinationTravelPlan = destinationTravelPlan
    }
}

public protocol TravelPlanSwapUseCase {
    func execute(_ travelPlanSwapBox: TravelPlanSwapBox) async throws
}

struct ConcreateTravelPlanSwapUseCase<Repository: AbstractRepository>: TravelPlanSwapUseCase where Repository.T == TravelPlan {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute(_ travelPlanSwapBox: TravelPlanSwapBox) async throws {
        try await withThrowingTaskGroup(of: Void.self) { taskGroup in // rethrows
            taskGroup.addTask { [self] in
                try await repository.upload(
                    at: travelPlanSwapBox.source,
                    entity: travelPlanSwapBox.sourceTravelPlan
                )
            }
            
            taskGroup.addTask { [self] in
                try await repository.upload(
                    at: travelPlanSwapBox.destination,
                    entity: travelPlanSwapBox.destinationTravelPlan
                )
            }
            
            for try await _ in taskGroup { }
        }
    }
}
