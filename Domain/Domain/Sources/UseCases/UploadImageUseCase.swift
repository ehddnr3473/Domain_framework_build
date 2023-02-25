//
//  UploadImageUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol UploadImageUseCase {
    func execute(at index: Int, _ image: UIImage) async throws
}

struct DefaultUploadImageUseCase: UploadImageUseCase {
    private let repository: ImagesRepository
    
    init(_ repository: ImagesRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int, _ image: UIImage) async throws {
        try await repository.upload(at: index, image)
    }
}
