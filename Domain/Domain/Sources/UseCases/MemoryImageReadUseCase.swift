//
//  MemoryImageReadUseCase.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol MemoryImageReadUseCase {
    func execute(at index: Int, completion: @escaping ((Result<UIImage, Error>) -> Void))
}

struct ConcreteMemoryImageReadUseCase<Repository: AbstractImageRepository>: MemoryImageReadUseCase {
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func execute(at index: Int, completion: @escaping ((Result<UIImage, Error>) -> Void)) {
        repository.read(at: index, completion)
    }
}
