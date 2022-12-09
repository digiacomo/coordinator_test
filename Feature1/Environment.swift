//
//  Environment.swift
//  Feature1
//
//  Created by Antonio Di Giacomo on 09/12/2022.
//

import Foundation
import Common
import UIKit

// encapsulates and exposes assets and functionalities to the outside
// so that other modules can consume them. Usually properties or closures
public struct ModuleResources {
}
// encapsulates all the dependencies required by this module to work.
// Usually in form of properties or closures
public struct ModuleDependencies {
    let childCoordinator: Closure<(UINavigationController, VoidClosure), AnyCoordinator<Void, Void>>
    
    public init(childCoordinator: @escaping Closure<(UINavigationController, VoidClosure), AnyCoordinator<Void, Void>>) {
        self.childCoordinator = childCoordinator
    }
}
// contains the dependencies required by this module to work which are
// exposed globally only internally in this module so that this instance
// can only be updated using the `inject` method.
// swiftlint:disable:next variable_name
internal var Dependencies: ModuleDependencies!
// contains and esposes publicly all the resources intended to be shared
// outside this module
// swiftlint:disable:next variable_name
public let Resources = ModuleResources()
// injection handle to pass dependencies.
public func inject(dependencies: ModuleDependencies) {
    Dependencies = dependencies
}
