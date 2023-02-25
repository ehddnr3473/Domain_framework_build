//
//  ReadImageUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol ReadImageUseCase {
    func execute(at index: Int, completion: @escaping ((Result<UIImage, Error>) -> Void))
}

struct DefaultReadImageUseCase: ReadImageUseCase {
    private let repository: ImagesRepository
    
    init(_ repository: ImagesRepository) {
        self.repository = repository
    }
    
    func execute(at index: Int, completion: @escaping ((Result<UIImage, Error>) -> Void)) {
        repository.read(at: index, completion)
    }
}
