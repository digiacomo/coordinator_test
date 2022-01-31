//
//  ViewModel.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import Foundation

struct ViewModel {
    let input: Input
    let output: Output
    
    init(text: String, completed: @escaping VoidClosure) {
        let output = Output(text: text, completed: completed)
        self.input = .init(buttonTapped: {
            output.completed?()
        })
        self.output = output
    }
}

extension ViewModel {
    struct Input {
        var buttonTapped: VoidClosure
    }
    
    struct Output {
        let text: String
        let completed: VoidClosure?
    }
}
