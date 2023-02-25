//
//  DeleteMemoryUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol DeleteMemoryUseCase {
    func execute(at index: Int) async throws
}

struct DefaultDeleteMemoryUseCase: DeleteMemoryUseCase {
    private let repository: MemoriesRepository
    
    init(_ repository: MemoriesRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
