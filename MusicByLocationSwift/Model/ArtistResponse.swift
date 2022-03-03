//
//  ArtistResponse.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 02/03/2022.
//

import Foundation


struct ArtistResponse : Codable {
    var resultCount:Int
    var results: [Artist]
    
    private enum CodingKeys:String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}
