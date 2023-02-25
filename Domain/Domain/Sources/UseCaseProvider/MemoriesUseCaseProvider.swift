//
//  MemoriesUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoriesUseCaseProvider {
    func provideUploadMemoryUseCase() -> UploadMemoryUseCase
    func provideReadMemoriesUseCase() -> ReadMemoriesUseCase
    func provideDeleteMemoryUseCase() -> DeleteMemoryUseCase
}

public struct DefaultMemoriesUseCaseProvider: MemoriesUseCaseProvider {
    private let repository: MemoriesRepository
    
    public init(repository: MemoriesRepository) {
        self.repository = repository
    }
    
    public func provideUploadMemoryUseCase() -> UploadMemoryUseCase {
        DefaultUploadMemoryUseCase(repository)
    }
    
    public func provideReadMemoriesUseCase() -> ReadMemoriesUseCase {
        DefaultReadMemoriesUseCase(repository)
    }
    
    public func provideDeleteMemoryUseCase() -> DeleteMemoryUseCase {
        DefaultDeleteMemoryUseCase(repository)
    }
}
