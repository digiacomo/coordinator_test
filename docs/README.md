## About The Project

Example project to illustrate Coordinator protocol.


<!-- GETTING STARTED -->
## Overview

Allow different frameworks (Feature1 and Feature2) to consume each other's user journeys without sharing concrete types with a simple and clear Dependency schema.

### Environment.swift

Bare bone dependency injection based on Swift structs. The idea is to encapsulate all the dependencies required by a module to work in closures. Keep in mind this is just a streamlined injection mechanism. It can be replaced anytime.

### Coordinator.swift

It's a Protocol to encapsulate any user journey based on the assumption that a User Journey (one or more set of screens) can be seen and consumed as a blackbox that requires an Input and returns one Output when the end is reached.

## Example

In this example we have a Main target called `Coordtest`, a framework `Common` that has top level types and a couple of mock feature frameworks `Feature1` and `Feature2`.
 - `Coordtest` has visibility over `Common`, `Feature1` and `Feature2`.
 - `Common` has no visibility on anything
 - `Feature1` has visibility on `Common` only
 - `Feature2` has visibility on `Common` only

### Feature1
contains Navigation implementation represented by MainCoordinator
mock View and ViewModel

### Feature2
contains Navigation implementation represented by ChildCoord
mock View and ViewModel

### The problem and solution
Navigation on MainCoordinator (Feature1) has a dependency on a ChildCoord (Feature2) however, we don't want to expose ChildCoord type to Feature1 as this would imply Feature2 to be visible to Feature1. Therefore the dependency is expressed as a Coordinator<Void, Void>. Which is a coordinator that takes Input and Outputs nothing.

- The injection happens in CoordTest which is the only scope where we have visibility on Feature1 and 2 at the same time.
- We could be having any kind of Input and Output and in case we have multiple inputs we can use Tuples.

### Closure syntactic sugar
Regular swift syntax can get in the way and make reading a bit difficult with these types therefore I've created a set of typealiases:

- `typealias Closure<I, O> = (I) -> O`
- `typealias VoidClosure = () -> Void`
- `typealias VoidOutputClosure<I> = (I) -> Void`
- `typealias VoidInputClosure<O> = () -> O`

This is because a Closure like this one: `Closure<(UINavigationController, VoidClosure), AnyCoordinator<Void, Void>>`
In regular swift syntax would look like so: `((UINavigationController, VoidClosure)) -> AnyCoordinator<Void, Void>`. Of course these are just typealiases. Not enforced in anyway anywhere.