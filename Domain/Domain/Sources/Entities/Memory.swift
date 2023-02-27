//
//  Memory.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public struct Memory: Hashable {
    public typealias Identifier = Int
    public let id: Identifier
    public let title: String
    public let uploadDate: Date
    
    public init(id: Int, title: String, uploadDate: Date) {
        self.id = id
        self.title = title
        self.uploadDate = uploadDate
    }
}
