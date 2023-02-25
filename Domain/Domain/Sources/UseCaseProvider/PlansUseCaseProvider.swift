//
//  PlansUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol PlansUseCaseProvider {
    func provideUploadPlanUseCase() -> UploadPlanUseCase
    func provideReadPlansUseCase() -> ReadPlansUseCase
    func provideDeletePlanUseCase() -> DeletePlanUseCase
    func provideSwapPlansUseCase() -> SwapPlansUseCase
}

public struct DefaultPlansUseCaseProvider: PlansUseCaseProvider {
    private let repository: PlansRepository
    
    public init(repository: PlansRepository) {
        self.repository = repository
    }
    
    public func provideUploadPlanUseCase() -> UploadPlanUseCase {
        DefaultUploadPlanUseCase(repository)
    }
    
    public func provideReadPlansUseCase() -> ReadPlansUseCase {
        DefaultReadPlansUseCase(repository)
    }
    
    public func provideDeletePlanUseCase() -> DeletePlanUseCase {
        DefaultDeletePlanUseCase(repository)
    }
    
    public func provideSwapPlansUseCase() -> SwapPlansUseCase {
        DefaultSwapPlansUseCase(repository)
    }
}
