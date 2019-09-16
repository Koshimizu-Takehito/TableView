//
//  TableNode.swift
//  TableView
//
//

import Foundation

public typealias TableNode<Section, Row>
    = AnyNode<Void, AnyNode<Section, AnyNode<Row, Never>>>

extension AnyNode: TableData where Value == Void, Child.Child.Child == Never {
    public typealias Section = Child.Value
    public typealias Row = Child.Child.Value

    public func numberOfSections() -> Int {
        return children.count
    }

    public func numberOfRows(in section: Int) -> Int {
        return child(at: section).children.count
    }

    public func section(at index: Int) -> Section {
        return child(at: index).value
    }

    public func row(at indexPath: IndexPath) -> Row {
        return child(at: indexPath[0]).child(at: indexPath[1]).value
    }
}
