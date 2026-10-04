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
  font: ("Yu Gothic", "Meiryo", "BIZ UDPGothic", "MS Gothic", "Noto Sans CJK JP", "IPAexGothic"),
) = {
  set text(font: font, lang: "ja")

  // タイトル部（元PDFの基準座標 Y=64.21pt, 113.21pt）
  place(top + center, dy: 64.21pt)[
    #text(size: 22pt, weight: "bold")[#department]
  ]
  place(top + center, dy: 113.21pt)[
    #text(size: 26pt, weight: "bold")[#report-title]
  ]

  // 表用の共通スタイル
  let header-cell(content, size: 12.5pt) = table.cell(
    align: center + horizon,
    fill: none,
    [#text(weight: "bold", size: size)[#content]]
  )

  let body-cell(content, size: 12pt) = table.cell(
    align: center + horizon,
    fill: none,
    [#text(size: size)[#content]]
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

  // メイングリッド表（元PDFの基準座標 X=56.03pt, Y=158.83pt）
  place(top + left, dx: 56.03pt, dy: 158.83pt)[
    #table(
      columns: (28.19pt, 44.43pt, 70.83pt, 127.62pt, 211.07pt),
      rows: (
        34.22pt, 34.39pt, 34.20pt, 34.23pt, 34.20pt, 34.39pt,
        34.23pt, 34.20pt, 34.20pt, 34.43pt, 34.19pt, 34.21pt,
        34.20pt, 65.03pt, 46.19pt, 47.43pt
      ),
      stroke: (x, y) => {
        // 外枠・主要仕切り線: 1.8pt, 内部罫線: 1.1pt
        let top-s = if y == 0 or y == 1 or y == 6 or y == 12 or y == 14 { 1.8pt + black } else { 1.1pt + black }
        let bottom-s = if y == 15 { 1.8pt + black } else { none }
        let left-s = if x == 0 { 1.8pt + black } else if x == 4 and y < 12 { 1.8pt + black } else { 1.1pt + black }
        let right-s = if x == 4 { 1.8pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
      },
      align: center + horizon,

      // Row 1: 実験演習記録 (cols 1-4) & 判定・指示ヘッダー (col 5)
      table.cell(colspan: 4, align: center + horizon)[#text(weight: "bold", size: 14pt)[実験演習記録]],
      table.cell(colspan: 1, align: center + horizon)[#text(weight: "bold", size: 13.5pt)[判定・指示]],

      // Row 2: 年月日時 (cols 2-3) & 共同作業者 (col 4) & 判定・指示記入欄 (col 5, rows 2-12)
      header-cell([]),
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 12.5pt)[年月日時]],
      header-cell([共同作業者]),
      table.cell(colspan: 1, rowspan: 11, align: left + top)[
        #pad(x: 10pt, y: 10pt)[#text(size: 11pt)[#eval-instruction]]
      ],

      // Rows 3-6: 実験記録
      ..exp-list.slice(0, 4).enumerate().map(((idx, item)) => (
        body-cell(item.at("num", default: "")),
        table.cell(colspan: 2, align: center + horizon)[#text(size: 12pt)[#item.at("date", default: "")]],
        body-cell(item.at("collaborator", default: "")),
      )).flatten(),

      // Row 7: レポート提出記録
      table.cell(colspan: 4, align: center + horizon)[#text(weight: "bold", size: 14pt)[レポート提出記録]],

      // Row 8: 提出年月日 (cols 2-3) & 期限年月日 (col 4)
      header-cell([]),
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 12.5pt)[提出年月日]],
      header-cell([期限年月日]),

      // Rows 9-12: 提出記録
      ..sub-list.slice(0, 4).map(item => (
        body-cell(item.at("type", default: "")),
        table.cell(colspan: 2, align: center + horizon)[#text(size: 12pt)[#item.at("date", default: "")]],
        body-cell(item.at("deadline", default: "")),
      )).flatten(),

      // Row 13: クラス (cols 1-2) / 班番号 (col 3) / テーマ (cols 4-5)
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 12.5pt)[クラス]],
      header-cell([班番号]),
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 12.5pt)[テーマ]],

      // Row 14: クラス値 / 班番号値 / テーマ値
      table.cell(colspan: 2, align: center + horizon)[#text(size: 13.5pt)[#class-name]],
      body-cell(str(group-number), size: 13.5pt),
      table.cell(colspan: 2, align: center + horizon)[#text(size: 14pt)[#theme]],

      // Row 15: レポート指導教員 (cols 1-3) / 学籍番号 (col 4) / 氏 名 (col 5)
      table.cell(colspan: 3, align: center + horizon)[#text(weight: "bold", size: 12.5pt)[レポート指導教員]],
      header-cell([学籍番号]),
      header-cell([氏 名]),

      // Row 16: 指導教員値 / 学籍番号値 / 氏名値
      table.cell(colspan: 3, align: center + horizon)[#text(size: 14pt)[#teacher]],
      body-cell(student-id, size: 14pt),
      body-cell(author, size: 14pt),
    )
  ]
}
