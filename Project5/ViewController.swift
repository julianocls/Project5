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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))

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
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submetAction = UIAlertAction(title: "Submit", style: .default) { [ weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submetAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        print(answer)
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



















