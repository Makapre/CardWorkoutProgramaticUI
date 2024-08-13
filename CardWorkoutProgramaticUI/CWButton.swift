//
//  CWButton.swift
//  CardWorkoutProgramaticUI
//
//  Created by Marius Preikschat on 12.06.21.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        backgroundColor: UIColor,
        title: String,
        padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    ) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        contentEdgeInsets = padding
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

@available(iOS 17, *)
#Preview {
    CWButton(
        backgroundColor: .systemRed,
        title: "STOP",
        padding: .init(top: 5, left: 20, bottom: 5, right: 20)
    )
}
