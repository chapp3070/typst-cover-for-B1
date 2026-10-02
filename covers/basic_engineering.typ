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
  font: ("IPAexGothic", "Harano Aji Gothic", "Yu Gothic", "Meiryo", "MS Gothic", "Hiragino Kaku Gothic ProN"),
) = {
  set text(font: font, lang: "ja")
  
  // タイトル部
  align(center)[
    #v(0.5cm)
    #text(size: 18pt, weight: "bold")[#department]
    #v(0.6cm)
    #text(size: 22pt, weight: "bold")[#report-title]
    #v(1.2cm)
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
    columns: (0.9cm, 3.4cm, 3.4cm, 1fr),
    rows: (
      1.8em, // 1: 実験演習記録
      1.8em, // 2: 年月日時 / 共同作業者
      1.8em, // 3: 実験1
      1.8em, // 4: 実験2
      1.8em, // 5: 実験3
      1.8em, // 6: 実験4
      1.8em, // 7: レポート提出記録
      1.8em, // 8: 提出年月日 / 期限年月日
      1.8em, // 9: 初
      1.8em, // 10: 再
      1.8em, // 11: 再2
      1.8em, // 12: 再3
      1.8em, // 13: クラス / 班番号 / テーマ ヘッダー
      2.4em, // 14: クラス / 班番号 / テーマ 内容
      1.8em, // 15: 指導教員 / 学籍番号 / 氏名 ヘッダー
      2.4em  // 16: 指導教員 / 学籍番号 / 氏名 内容
    ),
    align: (col, row) => center + horizon,
    stroke: 0.7pt + black,

    // Row 1-6 & Right Panel: 判定・指示
    table.cell(colspan: 3, align: center + horizon)[#text(weight: "bold", size: 11pt)[実験演習記録]],
    table.cell(rowspan: 12, align: center + top)[
      #v(0.5em)
      #text(weight: "bold", size: 11pt)[判定・指示]
      #v(0.5em)
      #align(left)[#text(size: 10pt)[#eval-instruction]]
    ],

    // Row 2: ヘッダー
    header-cell([]),
    header-cell([年月日時]),
    header-cell([共同作業者]),

    // Rows 3-6: 実験記録
    ..exp-list.slice(0, 4).enumerate().map(((idx, item)) => (
      body-cell(if item.at("num", default: "") != "" { item.num } else { str(idx + 1) }),
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

    // Row 13: 下部ヘッダー 1
    header-cell([クラス]),
    header-cell([班番号]),
    table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 10.5pt)[テーマ]],

    // Row 14: 下部内容 1
    body-cell(class-name),
    body-cell(str(group-number)),
    table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#theme]],

    // Row 15: 下部ヘッダー 2
    table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 10.5pt)[レポート指導教員]],
    header-cell([学籍番号]),
    header-cell([氏 名]),

    // Row 16: 下部内容 2
    table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#teacher]],
    body-cell(student-id),
    body-cell(author),
  )
}
