//
//  RulesVC.swift
//  CardWorkoutProgramaticUI
//
//  Created by Marius Preikschat on 12.06.21.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel     = UILabel()
    let rulesLabel     = UILabel()
    let excerciseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExcerciseLabel()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = """
            The value of each card represents the number of excercise you do.
        
            J = 11, Q = 12, K = 13, A = 14
        """
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExcerciseLabel() {
        view.addSubview(excerciseLabel)
        excerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        excerciseLabel.text = """
            ♥️  = Sit Ups
        
            ♦️  = Push Ups
        
            ♣️  = Burpees
        
            ♠️  = Jumping Jacks
        """
        excerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        excerciseLabel.textAlignment = .left
        excerciseLabel.lineBreakMode = .byWordWrapping
        excerciseLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            excerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            excerciseLabel.widthAnchor.constraint(equalToConstant: 250),
            excerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

@available(iOS 17, *)
#Preview {
    RulesVC()
}
