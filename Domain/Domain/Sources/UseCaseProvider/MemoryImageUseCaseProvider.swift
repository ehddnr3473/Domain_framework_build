//
//  MemoryImageUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol MemoryImageUseCaseProvider: AnyObject {
    func provideMemoryImageUploadUseCase() -> MemoryImageUploadUseCase
    func provideMemoryImageReadUseCase() -> MemoryImageReadUseCase
    func provideMemoryImageDeleteUseCase() -> MemoryImageDeleteUseCase
}

public final class ConcreteMemoryImageUseCaseProvider<Repository: AbstractImageRepository>: MemoryImageUseCaseProvider {
    private let repository: Repository
    
    public init(_ repository: Repository) {
        self.repository = repository
    }
    
    public func provideMemoryImageUploadUseCase() -> MemoryImageUploadUseCase {
        ConcreteMemoryImageUploadUseCase(repository)
    }
    
    public func provideMemoryImageReadUseCase() -> MemoryImageReadUseCase {
        ConcreteMemoryImageReadUseCase(repository)
    }
    
    public func provideMemoryImageDeleteUseCase() -> MemoryImageDeleteUseCase {
        ConcreteMemoryImageDeleteUseCase(repository)
    }
}
