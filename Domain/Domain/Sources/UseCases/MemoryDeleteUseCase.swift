//
//  MemoryDeleteUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryDeleteUseCase {
    func execute(at index: Int) async throws
}

struct ConcreteMemoryDeleteUseCase<Repository: AbstractRepository>: MemoryDeleteUseCase where Repository.T == Memory {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
