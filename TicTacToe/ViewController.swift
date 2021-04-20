//
//  ViewController.swift
//  TicTacToe
//
//  Created by Владислав on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    
    var currentPlayer = "X"
    var board = [String]()
    let rules = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        currentPlayer = "X"
        label.text = "Turn X"
        loadBoard()
        //print(board)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)
        
        if !board[index!].isEmpty
        {
            return
        }
        
        if currentPlayer == "X"
        {
            sender.setTitle("X", for: .normal)
            board[index!] = "X"
            currentPlayer = "O"
        }
        else
        {
            sender.setTitle("O", for: .normal)
            board[index!] = "O"
            currentPlayer = "X"
        }
        label.text = "Turn \(currentPlayer)"
        win()
    }
    func win()
    {
        for rule in rules
        {
            let p0 = board[rule[0]]
            let p1 = board[rule[1]]
            let p2 = board[rule[2]]
            
            if p0 == p1, p1 == p2, !p2.isEmpty
            {
                //print("Winner is player \(p2)")
                //currentPlayer = p2
                label.text = "Win \(p2)!"
                Allert(message : "Player \(p2) won!")
                return
            }
        }
        //print(board.contains(""))
        if !board.contains("")
        {
            self.img.image = #imageLiteral(resourceName: "Hands")
            label.text = "Draw!"
            Allert(message : "It`s a tie!")
        }
    }
    
    func Allert(message : String)
    {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){ _ in
            self.reset()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func reset()
    {
        self.img.backgroundColor = nil
        self.img.image = nil
        label.text = "Turn X"
        currentPlayer = "X"
        board.removeAll()
        loadBoard()
        for i in buttons
        {
            i.setTitle(nil, for: .normal)
        }
    }
    func loadBoard()
    {
        for i in 0..<buttons.count
        {
            board.append("")
        }
    }
}

