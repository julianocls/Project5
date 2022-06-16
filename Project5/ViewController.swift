//
//  ViewController.swift
//  Project5
//
//  Created by Juliano Santos on 16/6/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var userWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let startWorkdsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWorkdsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        userWords.removeAll(keepingCapacity: true)
        tableView.reloadData() //chama numberOfRowsInSection novamente
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return userWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = userWords[indexPath.row]
        return cell
    }
}



















