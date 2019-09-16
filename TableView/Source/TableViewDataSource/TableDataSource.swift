//
//  TableDataSource.swift
//  TableView
//
//

import UIKit

public protocol TableData {
    associatedtype Section
    associatedtype Row

    func numberOfSections() -> Int

    func numberOfRows(in section: Int) -> Int

    func section(at index: Int) -> Section

    func row(at indexPath: IndexPath) -> Row
}

public extension TableDataSource {
    class Configurator {
        public typealias Cell = (UITableView, IndexPath, Data.Row) -> UITableViewCell
        public typealias HeaderFooterTitle = (UITableView, Int, Data.Section) -> String?

        public var cell: Cell?
        public var headerTitle: HeaderFooterTitle?
        public var footerTitle: HeaderFooterTitle?

        public init(cell: Cell? = nil, headerTitle: HeaderFooterTitle? = nil, footerTitle: HeaderFooterTitle? = nil) {
            self.cell = cell
            self.headerTitle = headerTitle
            self.footerTitle = footerTitle
        }
    }
}

public final class TableDataSource<Data: TableData>: NSObject, UITableViewDataSource {

    public var data: Data?

    public var configurator: Configurator

    public init(data: Data? = nil, configurator: Configurator = Configurator()) {
        self.data = data
        self.configurator = configurator
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return data?.numberOfSections() ?? 1
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let data = data else { return nil }
        return configurator.headerTitle?(tableView, section, data.section(at: section))
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let data = data else { return nil }
        return configurator.footerTitle?(tableView, section, data.section(at: section))
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.numberOfRows(in: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data, let configure = configurator.cell else { return UITableViewCell() }
        return configure(tableView, indexPath, data.row(at: indexPath))
    }
}
