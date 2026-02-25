//
//  DiscoveryResponse.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

struct DiscoveryResponse: Codable {
    let page: Int
    let results: [DiscoveredMovie]
}
