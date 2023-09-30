//
//  DetailViewController.swift
//  NoteApp
//
//  Created by Yuga Samuel on 30/09/23.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var textView: UITextView!
    var notes: [Note]!
    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.text = note.text
    }
    
    func textViewDidChange(_ textView: UITextView) {
        saveNotes()
    }

    func saveNotes() {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else { return }
        notes[index].text = textView.text
        
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: FileManager.savePath)
        } catch {
            print("Cannot save notes.")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
