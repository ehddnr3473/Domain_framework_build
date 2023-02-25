//
//  DeleteImageUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public protocol DeleteImageUseCase {
    func execute(at index: Int) async throws
}

struct DefaultDeleteImageUseCase: DeleteImageUseCase {
    private let repository: ImagesRepository
    
    init(_ repository: ImagesRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int) async throws {
        try await repository.delete(at: index)
    }
}
