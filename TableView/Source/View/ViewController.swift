//
//  ViewController.swift
//  TableView
//
//

import UIKit

final class ViewController: UITableViewController {

    /// UITableViewDataSource
    let source = TableDataSource<TableNode<String, RowItem>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        source.data = sampleData
        source.configurator.headerTitle = configure
        source.configurator.cell = configure
        tableView.dataSource = source
    }
}

private func configure(tableView: UITableView, index: Int, title: String) -> String? {
    return title
}

private func configure(tableView: UITableView, indexPath: IndexPath, item: RowItem) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier, for: indexPath)
    switch (item, cell) {
    case let (.basic(text), cell as BasicCell):
        cell.textLabel?.text = text

    case let (.subTitle(text, detail), cell as SubTitleCell):
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = detail

    case let (.rightDetail(text, detail), cell as RightDetailCell):
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = detail

    case _:
        break
    }
    return cell
}
