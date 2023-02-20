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

public struct ConcreteTravelPlanUseCaseProvider: TravelPlanUseCaseProvider {
    private let repository: AbstractTravelPlanRepository
    
    public init(_ repository: AbstractTravelPlanRepository) {
        self.repository = repository
    }
    
    public func provideTravelPlanUploadUseCase() -> TravelPlanUploadUseCase {
        ConcreteTravelPlanUploadUseCase(repository)
    }
    
    public func provideTravelPlanReadUseCase() -> TravelPlanReadUseCase {
        ConcreteTravelPlanReadUseCase(repository)
    }
    
    public func provideTravelPlanDeleteUseCase() -> TravelPlanDeleteUseCase {
        ConcreteTravelPlanDeleteUseCase(repository)
    }
    
    public func provideTravelPlanSwapUseCase() -> TravelPlanSwapUseCase {
        ConcreateTravelPlanSwapUseCase(repository)
    }
}
