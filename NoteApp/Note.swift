//
//  Note.swift
//  NoteApp
//
//  Created by Yuga Samuel on 30/09/23.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var text: String
}
