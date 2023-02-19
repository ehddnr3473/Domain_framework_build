//
//  TravelPlanUseCaseProvider.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol TravelPlanUseCaseProvider {
    func provideTravelPlanUploadUseCase() -> TravelPlanUploadUseCase
    func provideTravelPlanReadUseCase() -> TravelPlanReadUseCase
    func provideTravelPlanDeleteUseCase() -> TravelPlanDeleteUseCase
    func provideTravelPlanSwapUseCase() -> TravelPlanSwapUseCase
}

public struct ConcreteTravelPlanUseCaseProvider<Repository: AbstractRepository>: TravelPlanUseCaseProvider where Repository.T == TravelPlan {
    private let repository: Repository
    
    public init(_ repository: Repository) {
        self.repository = repository
    }
    
    public func provideTravelPlanUploadUseCase() -> TravelPlanUploadUseCase {
        ConcreteTravelPlanUploadUseCase<Repository>(repository)
    }
    
    public func provideTravelPlanReadUseCase() -> TravelPlanReadUseCase {
        ConcreteTravelPlanReadUseCase<Repository>(repository)
    }
    
    public func provideTravelPlanDeleteUseCase() -> TravelPlanDeleteUseCase {
        ConcreteTravelPlanDeleteUseCase<Repository>(repository)
    }
    
    public func provideTravelPlanSwapUseCase() -> TravelPlanSwapUseCase {
        ConcreateTravelPlanSwapUseCase<Repository>(repository)
    }
}
