//
//  MainCoordinator.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import UIKit

struct MainCoord: Coordinator {
    weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func firstScreen() -> UIViewController {
        let vm = ViewModel(text: "First") {
            second()
        }
        return ViewController(vm)
    }
    
    func start(input: DeepLink?) {
        guard let deeplink = input else {
            let vc = firstScreen()
            rootController?.pushViewController(vc, animated: true)
            return
        }
        
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
        let coord = ChildCoord(rootController: newNavController) {
            finish(output: ())
        }
        let vc = coord.firstScreen()
        newNavController.pushViewController(vc, animated: false)
        rootController?.present(newNavController, animated: true)
    }
    
    func finish(output: Void) {
        rootController?.dismiss(animated: true)
    }
}
