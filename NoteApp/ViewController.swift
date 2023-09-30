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
        
        loadNotes()
    }
    
    func loadNotes() {
        do {
            let data = try Data(contentsOf: FileManager.savePath)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes.append(Note(text: "Sylvi"))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadNotes()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Note")
        
        var content = cell.defaultContentConfiguration()
        content.text = notes[indexPath.row].text
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.notes = notes
            vc.note = notes[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

