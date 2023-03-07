//
//  DeletePlanUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol DeletePlanUseCase {
    func execute(key: String, plans: [Plan]) async throws
}

struct DefaultDeletePlanUseCase: DeletePlanUseCase {
    private let repository: PlansRepository
    
    init(_ repository: PlansRepository) {
        self.repository = repository
    }
    
    func execute(key: String, plans: [Plan]) async throws {
        try await repository.delete(key: key, plans: plans)
    }
}
