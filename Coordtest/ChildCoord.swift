//
//  ChildCoord.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit

struct ChildCoord: Coordinator {
    weak var rootController: UINavigationController?
    private let completion: VoidClosure
    
    init(rootController: UINavigationController, completion: @escaping VoidClosure) {
        self.rootController = rootController
        self.completion = completion
    }
    
    func firstScreen() -> UIViewController {
        let vm = ViewModel(text: "First Child") {
            self.second()
        }
        return ViewController(vm)
    }
    
    func start(input: Void) {
        let vc = firstScreen()
        rootController?.pushViewController(vc, animated: true)
    }
    
    private func second() {
        let vm = ViewModel(text: "Second Child") {
            finish(output: ())
        }
        let vc = ViewController(vm)
        rootController?.pushViewController(vc, animated: true)
    }
    
    func finish(output: Void) {
        self.completion()
    }
}
