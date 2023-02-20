//
//  AbstractTravelPlanRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol AbstractTravelPlanRepository {
    func upload(at index: Int, entity: TravelPlan) async throws
    func read() async throws -> [TravelPlan]
    func delete(at index: Int) async throws
}
