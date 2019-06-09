//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by gui on 05/06/19.
//  Copyright © 2019 gui. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var btAnswers: [UIButton]!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var viTimer: UIView!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 30.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }

    func showResults() {
        performSegue(withIdentifier: "resultsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)
        quizManager.validateAnswer(index: index!)
        getNewQuiz()
    }
}
