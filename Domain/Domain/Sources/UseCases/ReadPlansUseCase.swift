//
//  ReadPlansUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol ReadPlansUseCase {
    func execute() async throws -> [Plan]
}

struct DefaultReadPlansUseCase: ReadPlansUseCase {
    private let repository: PlansRepository
    
    init(_ repository: PlansRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Plan] {
        try await repository.read()
    }
}
