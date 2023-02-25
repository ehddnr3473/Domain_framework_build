//
//  ReadMemoriesUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol ReadMemoriesUseCase {
    func execute() async throws -> [Memory]
}

struct DefaultReadMemoriesUseCase: ReadMemoriesUseCase {
    private let repository: MemoriesRepository
    
    init(_ repository: MemoriesRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Memory] {
        try await repository.read()
    }
}
