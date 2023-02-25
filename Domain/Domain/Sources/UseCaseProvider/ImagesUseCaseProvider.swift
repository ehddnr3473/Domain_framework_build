//
//  ImagesUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol ImagesUseCaseProvider: AnyObject {
    func provideUploadImageUseCase() -> UploadImageUseCase
    func provideReadImageUseCase() -> ReadImageUseCase
    func provideDeleteImageUseCase() -> DeleteImageUseCase
}

public final class DefaultImagesUseCaseProvider: ImagesUseCaseProvider {
    private let repository: ImagesRepository
    
    public init(repository: ImagesRepository) {
        self.repository = repository
    }
    
    public func provideUploadImageUseCase() -> UploadImageUseCase {
        DefaultUploadImageUseCase(repository)
    }
    
    public func provideReadImageUseCase() -> ReadImageUseCase {
        DefaultReadImageUseCase(repository)
    }
    
    public func provideDeleteImageUseCase() -> DeleteImageUseCase {
        DefaultDeleteImageUseCase(repository)
    }
}
