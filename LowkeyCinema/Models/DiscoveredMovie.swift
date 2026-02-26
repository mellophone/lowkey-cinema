//
//  DiscoveredMovie.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

struct DiscoveredMovie: Codable, Equatable, Identifiable {
    var id: Int
    var title: String
    var releaseDate: String
    var backdropPath: String?
    
    var releaseYear: Int? {
        Int(releaseDate.split(separator: "-")[0])
    }
    
    var cardTitle: String {
        guard let releaseYear else { return title }
        
        return "\(title) (\(releaseYear))"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}

#if DEBUG
extension DiscoveredMovie {
    static let starWars = DiscoveredMovie(
        id: 11,
        title: "Star Wars",
        releaseDate: "1977-05-25",
        backdropPath: "/2w4xG178RpB4MDAIfTkqAuSJzec.jpg"
    )
    
    static let zootopia2 = DiscoveredMovie(
        id: 1084242,
        title: "Zootopia 2",
        releaseDate: "2025-11-26",
        backdropPath: "/7nfpkR9XsQ1lBNCXSSHxGV7Dkxe.jpg"
    )
}
#endif
