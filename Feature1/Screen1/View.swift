//
//  View.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit

extension ViewController {
    final class View: UIView {
        private (set) lazy var label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.backgroundColor = .white
            return label
        }()
        
        private (set) lazy var button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Go", for: .normal)
            return button
        }()
        
        private (set) lazy var vStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        init() {
            super.init(frame: .zero)
            [label, button].forEach(vStack.addArrangedSubview)
            addSubview(vStack)
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: vStack.topAnchor),
                self.bottomAnchor.constraint(equalTo: vStack.bottomAnchor),
                self.leftAnchor.constraint(equalTo: vStack.leftAnchor),
                self.rightAnchor.constraint(equalTo: vStack.rightAnchor),
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

