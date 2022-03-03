//
//  Artist.swift
//  MusicByLocationSwift
//
//  Created by Hin, Ethan-Scott (WING) on 02/03/2022.
//

import Foundation

struct Artist:Codable, Hashable {
    var name:String
    var link:String
    var genre:String
    
    private enum CodingKeys:String, CodingKey {
        case name = "artistName"
        case link = "artistLinkUrl"
        case genre = "primaryGenreName"
    }
}
