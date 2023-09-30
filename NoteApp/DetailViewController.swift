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
        
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteNote))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareNote))
        
        navigationItem.rightBarButtonItems = [deleteButton, shareButton]
        
        textView.delegate = self
        textView.text = note.text
    }
    
    @objc func deleteNote() {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
            saveNotes()
        }
    }
    
    @objc func shareNote() {
        guard let message = textView.text else { return }
        let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
        
        if let popoverPresentationController = vc.popoverPresentationController {
            popoverPresentationController.sourceView = view
            popoverPresentationController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
        present(vc, animated: true)
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
