//
//  SwapPlansUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public struct SwapPlansBox {
    public let source: Int
    public let destination: Int
    public let sourcePlan: Plan
    public let destinationPlan: Plan
    
    public init(source: Int,
                destination: Int,
                sourcePlan: Plan,
                destinationPlan: Plan) {
        self.source = source
        self.destination = destination
        self.sourcePlan = sourcePlan
        self.destinationPlan = destinationPlan
    }
}

public protocol SwapPlansUseCase {
    func execute(_ planSwapBox: SwapPlansBox) async throws
}

struct DefaultSwapPlansUseCase: SwapPlansUseCase {
    private let repository: PlansRepository
    
    init(_ repository: PlansRepository) {
        self.repository = repository
    }
    
    func execute(_ swapPlansBox: SwapPlansBox) async throws {
        try await withThrowingTaskGroup(of: Void.self) { taskGroup in // rethrows
            taskGroup.addTask { [self] in
                try await repository.upload(
                    at: swapPlansBox.source,
                    plan: swapPlansBox.destinationPlan
                )
            }
            
            taskGroup.addTask { [self] in
                try await repository.upload(
                    at: swapPlansBox.destination,
                    plan: swapPlansBox.sourcePlan
                )
            }
            
            for try await _ in taskGroup { }
        }
    }
}
