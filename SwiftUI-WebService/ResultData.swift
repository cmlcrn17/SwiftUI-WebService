//
//  ProductCapture.swift
//  SwiftUI-WebService
//
//  Created by Ceren Taşsın on 13.08.2021.
//  Copyright © 2021 ceren. All rights reserved.
//

import Foundation

// MARK: - ProductCatch
struct ResultData: Codable {
    let success: Bool?
    let data: DataClass_ProductCatch?
}

// MARK: - DataClass
struct DataClass_ProductCatch: Codable {
    let customerID, gameID: Int?
    let startDate, endDate, nextGameStart: String?
    let remainingLife, gameLevel, gamePoint: Int?

    enum CodingKeys: String, CodingKey {
        case customerID = "CustomerId"
        case gameID = "GameId"
        case startDate, endDate, nextGameStart, remainingLife, gameLevel, gamePoint
    }
}
