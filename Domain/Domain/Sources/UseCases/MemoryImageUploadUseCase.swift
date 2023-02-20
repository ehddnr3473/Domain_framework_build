//
//  MemoryImageUploadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol MemoryImageUploadUseCase {
    func execute(at index: Int, _ image: UIImage) async throws
}

struct ConcreteMemoryImageUploadUseCase: MemoryImageUploadUseCase {
    private let repository: AbstractImageRepository
    
    init(_ repository: AbstractImageRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int, _ image: UIImage) async throws {
        try await repository.upload(at: index, image)
    }
}
