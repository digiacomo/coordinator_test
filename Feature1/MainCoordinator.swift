//
//  MainCoordinator.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit
import Common

public struct MainCoord: Coordinator {
    weak var rootController: UINavigationController?
    
    public init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    public func firstScreen(input: DeepLink?) -> UIViewController {
        let vm = ViewModel(text: "First") {
            second()
        }
        return ViewController(vm)
    }
    
    public func start(input: DeepLink?) {
        guard let deeplink = input else {
            let vc = firstScreen(input: input)
            rootController?.pushViewController(vc, animated: true)
            return
        }        
    }
    
    public func finish(output: Void) {
        rootController?.dismiss(animated: true)
    }
    
    private func second() {
        let vm = ViewModel(text: "Second") {
            childCoord()
        }
        let vc = ViewController(vm)
        rootController?.pushViewController(vc, animated: true)
    }
    
    private func childCoord() {
        let newNavController = UINavigationController()
        let coord = Dependencies.childCoordinator((newNavController, {
            finish(output: ())
        }))
        let vc = coord.firstScreen(input: ())
        newNavController.pushViewController(vc, animated: false)
        rootController?.present(newNavController, animated: true)
    }
}
