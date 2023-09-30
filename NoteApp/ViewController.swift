//
//  ViewController.swift
//  NoteApp
//
//  Created by Yuga Samuel on 30/09/23.
//

import UIKit

class ViewController: UITableViewController {
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NoteApp"
        
        notes.append(Note(note: "Sylvi"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Note")
        
        var content = cell.defaultContentConfiguration()
        content.text = notes[indexPath.row].note
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.initialNote = notes[indexPath.row].note
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

