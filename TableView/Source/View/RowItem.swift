//
//  _RowItem.swift
//  TableView
//
//

import Foundation

public enum RowItem {
    case basic(text: String)
    case subTitle(text: String, detail: String)
    case rightDetail(text: String, detail: String)

    var identifier: String {
        switch self {
        case .basic:
            return "basic"
        case .subTitle:
            return "subTitle"
        case .rightDetail:
            return "rightDetail"
        }
    }
}
