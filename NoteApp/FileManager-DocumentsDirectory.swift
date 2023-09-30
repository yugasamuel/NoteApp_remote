//
//  FileManager-DocumentsDirectory.swift
//  NoteApp
//
//  Created by Yuga Samuel on 30/09/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
