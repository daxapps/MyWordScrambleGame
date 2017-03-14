//
//  ViewController.swift
//  MyWordScrambleGame
//
//  Created by Jason Crawford on 3/14/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                
                allWords = startWords.components(separatedBy: "\n")
                
            } else {
                
                allWords = ["silkworm"]
            }
        }
        
        startGame()
    }
    
    func startGame() {
        
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        
        cell.textLabel?.text = usedWords[indexPath.row]
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

