//
//  Exercise.swift
//  DDW
//
//  Created by Ellen Stavrou on 05/12/2023.
//

import Foundation
import FirebaseFirestore

struct Exercise: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String // include exercise cues in description
    // video
    
}

extension Exercise {
    func asDictionary() -> [String: Any] {
        return [
            "name": name,
            "description": description
            // Add other properties as needed
        ]
    }
}
