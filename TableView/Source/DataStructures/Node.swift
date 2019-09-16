//
//  Node.swift
//  TableView
//
//

import Foundation

public protocol Node {
    associatedtype Value
    associatedtype Child: Node

    var value: Value { get set }
    var children: [Child] { get set }
}

public extension Node {
    func child(at index: Int) -> Child {
        children[index]
    }
}

public final class AnyNode<Value, Child>: Node where Child: Node {
    public var value: Value
    public var children: [Child]

    public init(value: Value, children: [Child]) {
        self.value = value
        self.children = children
    }
}

extension Never: Node {

    public typealias Value = Never // 値は存在しない
    public typealias Child = Never // 子ノードも存在しない

    public var value: Never {
        get {
            switch self {
            }
        }
        set {
        }
    }

    public var children: [Never] {
        get {
            switch self {
            }
        }
        set {
        }
    }
}

public extension AnyNode where Value == Void {
    convenience init(_ children: [Child]) {
        self.init(value: (), children: children)
    }

    convenience init() {
        self.init(value: (), children: [])
    }
}

public extension AnyNode where Child == Never {
    convenience init(value: Value) {
        self.init(value: value, children: [])
    }
}

public extension AnyNode where Value == Void, Child == Never {
    convenience init() {
        self.init(value: (), children: [])
    }
}

extension AnyNode: ExpressibleByArrayLiteral where Value == Void {
    public convenience init(arrayLiteral elements: Child...) {
        self.init(elements)
    }
}
