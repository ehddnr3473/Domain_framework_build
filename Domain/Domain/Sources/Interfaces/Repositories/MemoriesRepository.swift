//
//  MemoriesRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/21.
//

import Foundation

public protocol MemoriesRepository {
    func upload(at index: Int, memory: Memory) async throws
    func read() async throws -> [Memory]
    func delete(at index: Int) async throws
}
