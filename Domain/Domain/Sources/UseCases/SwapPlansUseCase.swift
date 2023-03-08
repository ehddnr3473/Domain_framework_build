//
//  SwapPlansUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public struct SwapPlansBox {
    public let sourceKey: String
    public let destinationKey: String
    public let sourcePlan: Plan
    public let destinationPlan: Plan
    
    public init(sourceKey: String,
                destinationKey: String,
                sourcePlan: Plan,
                destinationPlan: Plan) {
        self.sourceKey = sourceKey
        self.destinationKey = destinationKey
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
        try await repository.swap(swapPlansBox)
        // Migration to Repository
        //        try await withT hrowingTaskGroup(of: Void.self) { taskGroup in // rethrows
        //            taskGroup.addTask {
        //                try await repository.delete(key: swapPlansBox.sourceKey)
        //                try await repository.delete(key: swapPlansBox.destinationKey)
        //            }
        //
        //            taskGroup.addTask { [self] in
        //                try await repository.upload(
        //                    key: swapPlansBox.sourceKey,
        //                    plan: swapPlansBox.destinationPlan
        //                )
        //            }
        //
        //            taskGroup.addTask { [self] in
        //                try await repository.upload(
        //                    key: swapPlansBox.destinationKey,
        //                    plan: swapPlansBox.sourcePlan
        //                )
        //            }
        //
        //            for try await _ in taskGroup { }
        //        }
    }
}
