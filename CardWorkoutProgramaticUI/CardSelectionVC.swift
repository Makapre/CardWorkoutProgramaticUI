//
//  CardSelectionVC.swift
//  CardWorkoutProgramaticUI
//
//  Created by Marius Preikschat on 12.06.21.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView = UIImageView()
    let startButton   = CWButton(backgroundColor: .systemGreen, title: "START")
    let stopButton    = CWButton(backgroundColor: .systemRed,   title: "STOP")
    let rulesButton   = CWButton(backgroundColor: .systemBlue,  title: "RULES")
    
    var timer: Timer!
    var cards: [UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        timer.invalidate()
        startTimer()
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureStartButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
        
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 115),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            startButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30)
        ])
        
        startButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
//        for navigtation controller
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}
