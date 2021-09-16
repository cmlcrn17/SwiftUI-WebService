//
//  ResultGamification.swift
//  SwiftUI-WebService
//
//  Created by Ceren Taşsın on 8.09.2021.
//  Copyright © 2021 ceren. All rights reserved.
//

import Foundation

public class ResultGamification {
    
    var status: Int?
    var data: Data?
    
    init(status: Int, data: Data) {
        self.status = status
        self.data = data
    }
}
