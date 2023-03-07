//
//  DeleteImageUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol DeleteImageUseCase {
    func execute(key: String) async throws
}

struct DefaultDeleteImageUseCase: DeleteImageUseCase {
    private let repository: ImagesRepository
    
    init(_ repository: ImagesRepository) {
        self.repository = repository
    }
    
    func execute(key: String) async throws {
        try await repository.delete(key: key)
    }
}
