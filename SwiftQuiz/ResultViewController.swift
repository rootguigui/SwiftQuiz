//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by gui on 05/06/19.
//  Copyright © 2019 gui. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbAnswered.text = "Perguntas Respondidas: \(totalAnswers)"
        lbCorrect.text = "Perguntas corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers * 100 / totalAnswers
        lbResult.text = "\(score)%"
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
