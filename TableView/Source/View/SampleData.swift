//
//  SampleData.swift
//  TableView
//
//

/// sample data
let sampleData: TableNode<String, RowItem> = [
    .init(
        value: "カボチャ大王",
        children: [
            .init(value: .basic(text: "🎃🎃🎃"))
        ]
    ),
    .init(
        value: "猫ちゃんの顔",
        children: [
            .init(value: .subTitle(text: "😹😹😹", detail: "嬉し泣きするネコの顔")),
            .init(value: .subTitle(text: "😼😼😼", detail: "きざな笑いをするネコの顔")),
            .init(value: .subTitle(text: "😻😻😻", detail: "目がハートのネコの笑顔")),
        ]
    ),
    .init(
        value: "恐竜",
        children: [
            .init(value: .rightDetail(text: "🦖🦖🦖", detail: "ティラノサウルス")),
            .init(value: .rightDetail(text: "🦕🦕🦕", detail: "ブラキオサウルス"))
        ]
    )
]
