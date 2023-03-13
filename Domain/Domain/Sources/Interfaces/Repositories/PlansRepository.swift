//
//  PlansRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/17.
//

import Foundation

public protocol PlansRepository {
    func upload(plan: Plan) async throws
    func read() async throws -> [Plan]
    func delete(key: String) async throws
}
