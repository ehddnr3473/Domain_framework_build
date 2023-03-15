//
//  CoordinateUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation

public protocol CoordinateUseCaseProvider {
    func provideSearchCoordinateUseCase() -> SearchCoordinateUseCase
}

public struct DefaultCoordinateUseCaseProvider: CoordinateUseCaseProvider {
    private let repository: CoordinateRepository
    
    public init(repository: CoordinateRepository) {
        self.repository = repository
    }
    
    public func provideSearchCoordinateUseCase() -> SearchCoordinateUseCase {
        DefaultSearchCoordinateUseCase(repository)
    }
}
