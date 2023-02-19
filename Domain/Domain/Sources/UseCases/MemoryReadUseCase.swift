//
//  MemoryReadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryReadUseCase {
    func execute() async throws -> [Memory]
}

struct ConcreteMemoryReadUseCase<Repository: AbstractRepository>: MemoryReadUseCase where Repository.T == Memory {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Memory] {
        try await repository.read()
    }
}
