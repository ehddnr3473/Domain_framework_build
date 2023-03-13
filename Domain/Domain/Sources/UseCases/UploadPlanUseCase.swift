//
//  UploadPlanUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol UploadPlanUseCase {
    func execute(plan: Plan) async throws
}

struct DefaultUploadPlanUseCase: UploadPlanUseCase {
    private let repository: PlansRepository
    
    init(_ repository: PlansRepository) {
        self.repository = repository
    }
    
    public func execute(plan: Plan) async throws {
        try await repository.upload(plan: plan)
    }
}
