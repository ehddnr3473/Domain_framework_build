//
//  MemoryUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryUseCaseProvider {
    func provideMemoryUploadUseCase() -> MemoryUploadUseCase
    func provideMemoryReadUseCase() -> MemoryReadUseCase
    func provideMemoryDeleteUseCase() -> MemoryDeleteUseCase
}

public struct ConcreteMemoryUseCaseProvider<Repository: AbstractRepository>: MemoryUseCaseProvider where Repository.T == Memory {
    private let repository: Repository
    
    public init(_ repository: Repository) {
        self.repository = repository
    }
    
    public func provideMemoryUploadUseCase() -> MemoryUploadUseCase {
        ConcreteMemoryUploadUseCase(repository)
    }
    
    public func provideMemoryReadUseCase() -> MemoryReadUseCase {
        ConcreteMemoryReadUseCase(repository)
    }
    
    public func provideMemoryDeleteUseCase() -> MemoryDeleteUseCase {
        ConcreteMemoryDeleteUseCase(repository)
    }
}
