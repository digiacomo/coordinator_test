//
//  Coordinator.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import Foundation
import UIKit

public typealias Closure<I, O> = (I) -> O
public typealias VoidClosure = () -> Void
public typealias VoidOutputClosure<I> = (I) -> Void
public typealias VoidInputClosure<O> = () -> O

public protocol Coordinator {
    associatedtype Input
    associatedtype Output
    func start(input: Input)
    func finish(output: Output)
    func firstScreen(input: Input) -> UIViewController
}

public indirect enum DeepLink {
    case first(DeepLink?)
    case second(DeepLink?)
    case firstChild(DeepLink?)
    case secondChild(DeepLink?)
}

/// Type erasure for Journey so that any Type conforming to Journey can be passed around hiding the concrete implementation
public class AnyCoordinator<Input, Output>: Coordinator {
    private let startClosure: (Input) -> Void
    private let finishClosure: (Output) -> Void
    private let firstScreenClosure: (Input) -> UIViewController

    public init<T: Coordinator>(base: T) where T.Input == Input, T.Output == Output {
        self.startClosure = base.start
        self.finishClosure = base.finish
        self.firstScreenClosure = base.firstScreen
    }

    public func start(input: Input) {
        startClosure(input)
    }

    public func finish(output: Output) {
        finishClosure(output)
    }

    public func firstScreen(input: Input) -> UIViewController {
        firstScreenClosure(input)
    }
}

public extension Coordinator {
    var eraseToAnyCoordinator: AnyCoordinator<Input, Output> {
        AnyCoordinator(base: self)
    }
}
