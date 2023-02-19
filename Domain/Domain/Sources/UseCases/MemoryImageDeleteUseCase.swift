//
//  MemoryImageDeleteUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryImageDeleteUseCase {
    func execute(at index: Int) async throws
}

struct ConcreteMemoryImageDeleteUseCase<Repository: AbstractImageRepository>: MemoryImageDeleteUseCase {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
