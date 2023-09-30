//
//  DetailViewController.swift
//  NoteApp
//
//  Created by Yuga Samuel on 30/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var note: UITextView!
    var initialNote: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note.text = initialNote
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
