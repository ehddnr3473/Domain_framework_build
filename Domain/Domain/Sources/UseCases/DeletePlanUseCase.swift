//
//  DeletePlanUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol DeletePlanUseCase {
    func execute(at index: Int) async throws
}

struct DefaultDeletePlanUseCase: DeletePlanUseCase {
    private let repository: PlansRepository
    
    init(_ repository: PlansRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
