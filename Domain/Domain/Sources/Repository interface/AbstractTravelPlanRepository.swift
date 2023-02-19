//
//  AbstractTravelPlanRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol AbstractRepository {
    associatedtype T
    func upload(at index: Int, entity: T) async throws
    func read() async throws -> [T]
    func delete(at index: Int) async throws
}
