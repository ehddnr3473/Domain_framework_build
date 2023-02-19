//
//  Memory.swift
//  Domain
//
//  Created by 김동욱 on 2023/02/18.
//

import Foundation

public struct Memory {
    public let title: String
    public let index: Int
    public let uploadDate: Date
    
    public init(title: String, index: Int, uploadDate: Date) {
        self.title = title
        self.index = index
        self.uploadDate = uploadDate
    }
}
