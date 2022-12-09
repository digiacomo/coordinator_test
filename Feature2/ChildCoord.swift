//
//  ChildCoord.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit
import Common

public struct ChildCoord: Coordinator {
    weak var rootController: UINavigationController?
    private let completion: VoidClosure
    
    public init(rootController: UINavigationController, completion: @escaping VoidClosure) {
        self.rootController = rootController
        self.completion = completion
    }
    
    public func firstScreen(input: Void) -> UIViewController {
        let vm = ViewModel(text: "First Child") {
            self.second()
        }
        return ViewController(vm)
    }
    
    public func start(input: Void) {
        let vc = firstScreen(input: input)
        rootController?.pushViewController(vc, animated: true)
    }
    
    private func second() {
        let vm = ViewModel(text: "Second Child") {
            finish(output: ())
        }
        let vc = ViewController(vm)
        rootController?.pushViewController(vc, animated: true)
    }
    
    public func finish(output: Void) {
        self.completion()
    }
}
