//
//  Coordinator.swift
//  Coordtest
//
//  Created by Antonio Di Giacomo on 31/01/2022.
//

import Foundation
import UIKit

typealias VoidClosure = () -> Void
typealias VoidOutputClosure<I> = (I) -> Void
typealias VoidInputClosure<O> = () -> O

protocol Coordinator {
    associatedtype Input
    associatedtype Output
    func start(input: Input)
    func finish(output: Output)
    func firstScreen() -> UIViewController
}

indirect enum DeepLink {
    case first(DeepLink?)
    case second(DeepLink?)
    case firstChild(DeepLink?)
    case secondChild(DeepLink?)
}
