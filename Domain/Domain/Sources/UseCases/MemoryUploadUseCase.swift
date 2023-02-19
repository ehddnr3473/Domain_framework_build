//
//  MemoryUploadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryUploadUseCase {
    func execute(at index: Int, _ memory: Memory) async throws
}

struct ConcreteMemoryUploadUseCase<Repository: AbstractRepository>: MemoryUploadUseCase where Repository.T == Memory {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute(at index: Int, _ memory: Memory) async throws {
        try await repository.upload(at: index, entity: memory)
    }
}
