//
//  AbstractImageRepository.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation
import UIKit

public protocol AbstractImageRepository: AnyObject {
    func upload(at index: Int, _ image: UIImage) async throws
    func read(at index: Int, _ completion: @escaping ((Result<UIImage, Error>) -> Void))
    func delete(at index: Int) async throws
}
