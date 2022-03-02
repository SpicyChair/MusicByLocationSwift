//
//  ArtistResponse.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 02/03/2022.
//

import Foundation


struct ArtistResponse : Codable {
    var count:Int
    var results: [Artist]
    
    private enum codingKeys:String, CodingKey {
        case count = "resultCount"
        case results = "results"
    }
}
