//
//  UploadMemoryUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol UploadMemoryUseCase {
    func execute(_ memory: Memory) async throws
}

struct DefaultUploadMemoryUseCase: UploadMemoryUseCase {
    private let repository: MemoriesRepository
    
    init(_ repository: MemoriesRepository) {
        self.repository = repository
    }
    
    func execute(_ memory: Memory) async throws {
        try await repository.upload(memory)
    }
}
