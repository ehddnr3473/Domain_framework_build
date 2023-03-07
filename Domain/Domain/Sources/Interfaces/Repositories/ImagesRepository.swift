//
//  ImagesRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol ImagesRepository: AnyObject {
    func upload(key: String, _ image: UIImage) async throws
    func read(key: String, _ completion: @escaping ((Result<UIImage, Error>) -> Void))
    func delete(key: String) async throws
}
