// covers/basic_engineering.typ
// 工学基礎実験（Basic Engineering Laboratory）表紙レイアウト

#let make-basic-engineering-cover(
  department: "知能情報システム工学科",
  report-title: "工学基礎実験レポート",
  experiments: (
    (num: "1", date: "", collaborator: ""),
    (num: "2", date: "", collaborator: ""),
    (num: "3", date: "", collaborator: ""),
    (num: "", date: "", collaborator: ""),
  ),
  submissions: (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  ),
  class-name: "",
  group-number: "",
  theme: "",
  teacher: "",
  student-id: "",
  author: "",
  eval-instruction: "",
  font: ("Yu Gothic", "Meiryo", "MS Gothic", "BIZ UDPGothic", "Noto Sans CJK JP", "IPAexGothic"),
) = {
  set text(font: font, lang: "ja")
  
  // タイトル部
  align(center)[
    #v(0.6cm)
    #text(size: 20pt, weight: "bold")[#department]
    #v(0.8cm)
    #text(size: 24pt, weight: "bold")[#report-title]
    #v(1.4cm)
  ]

  // 表用の共通スタイル
  let header-cell(content) = table.cell(
    align: center + horizon,
    fill: none,
    [#text(weight: "bold", size: 10.5pt)[#content]]
  )

  let body-cell(content) = table.cell(
    align: center + horizon,
    fill: none,
    [#text(size: 10.5pt)[#content]]
  )

  // 実験記録リストの補完（4行分を担保）
  let default-exps = (
    (num: "1", date: "", collaborator: ""),
    (num: "2", date: "", collaborator: ""),
    (num: "3", date: "", collaborator: ""),
    (num: "", date: "", collaborator: ""),
  )
  let exp-list = experiments + default-exps.slice(calc.min(experiments.len(), 4))

  // 提出記録リストの補完（4行分を担保）
  let default-subs = (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  )
  let sub-list = submissions + default-subs.slice(calc.min(submissions.len(), 4))

  // メイングリッド表
  table(
    columns: (1.1cm, 3.5cm, 3.5cm, 1fr),
    rows: (
      2.0em, // 1: 実験演習記録
      2.0em, // 2: 年月日時 / 共同作業者
      2.0em, // 3: 実験1
      2.0em, // 4: 実験2
      2.0em, // 5: 実験3
      2.0em, // 6: 実験4
      2.0em, // 7: レポート提出記録
      2.0em, // 8: 提出年月日 / 期限年月日
      2.0em, // 9: 初
      2.0em, // 10: 再
      2.0em, // 11: 再2
      2.0em, // 12: 再3
      2.0em, // 13: クラス / 班番号 / テーマ ヘッダー
      2.8em, // 14: クラス / 班番号 / テーマ 内容
      2.0em, // 15: 指導教員 / 学籍番号 / 氏名 ヘッダー
      2.8em  // 16: 指導教員 / 学籍番号 / 氏名 内容
    ),
    align: (col, row) => center + horizon,
    stroke: 0.7pt + black,

    // Row 1-6 & Right Panel: 判定・指示
    table.cell(colspan: 3, align: center + horizon)[#text(weight: "bold", size: 11pt)[実験演習記録]],
    table.cell(rowspan: 12, align: center + top)[
      #v(0.6em)
      #text(weight: "bold", size: 11pt)[判定・指示]
      #v(0.6em)
      #align(left)[#text(size: 10pt)[#eval-instruction]]
    ],

    // Row 2: ヘッダー
    header-cell([]),
    header-cell([年月日時]),
    header-cell([共同作業者]),

    // Rows 3-6: 実験記録
    ..exp-list.slice(0, 4).enumerate().map(((idx, item)) => (
      body-cell(item.at("num", default: "")),
      body-cell(item.at("date", default: "")),
      body-cell(item.at("collaborator", default: "")),
    )).flatten(),

    // Row 7: レポート提出記録 ヘッダー
    table.cell(colspan: 3, align: center + horizon)[#text(weight: "bold", size: 11pt)[レポート提出記録]],

    // Row 8: ヘッダー
    header-cell([]),
    header-cell([提出年月日]),
    header-cell([期限年月日]),

    // Rows 9-12: 提出記録
    ..sub-list.slice(0, 4).map(item => (
      body-cell(item.at("type", default: "")),
      body-cell(item.at("date", default: "")),
      body-cell(item.at("deadline", default: "")),
    )).flatten(),

    // Row 13: 下部ヘッダー 1 (クラスは Col1+Col2 に配置)
    table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 10.5pt)[クラス]],
    header-cell([班番号]),
    header-cell([テーマ]),

    // Row 14: 下部内容 1
    table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#class-name]],
    body-cell(str(group-number)),
    body-cell(theme),

    // Row 15: 下部ヘッダー 2 (指導教員は Col1+Col2 に配置)
    table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 10.5pt)[レポート指導教員]],
    header-cell([学籍番号]),
    header-cell([氏 名]),

    // Row 16: 下部内容 2
    table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#teacher]],
    body-cell(student-id),
    body-cell(author),
  )
}
