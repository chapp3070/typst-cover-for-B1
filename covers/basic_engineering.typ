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

  // ==========================================
  // 外枠と主要仕切り線（絶対に欠損しないよう明示描画）
  // ==========================================

  // 1. 最外枠矩形 (dx: 56.03pt, dy: 158.83pt, 幅: 482.14pt, 高さ: 603.94pt, 線幅: 1.8pt)
  place(top + left, dx: 56.03pt, dy: 158.83pt)[
    #rect(width: 482.14pt, height: 603.94pt, stroke: 1.8pt + black)
  ]

  // 2. 判定・指示の左側垂直仕切り線 (X: 327.10pt, Y: 158.83pt〜569.92pt, 長さ: 411.09pt, 線幅: 1.8pt)
  place(top + left, dx: 327.10pt, dy: 158.83pt)[
    #line(start: (0pt, 0pt), end: (0pt, 411.09pt), stroke: 1.8pt + black)
  ]

  // 3. 実験演習記録・判定指示の下部水平仕切り線 (Y: 193.05pt, 幅: 482.14pt, 線幅: 1.8pt)
  place(top + left, dx: 56.03pt, dy: 193.05pt)[
    #line(start: (0pt, 0pt), end: (482.14pt, 0pt), stroke: 1.8pt + black)
  ]

  // 4. 実験記録と提出記録の間の水平仕切り線 (Y: 364.46pt, 幅: 271.07pt, 線幅: 1.8pt)
  place(top + left, dx: 56.03pt, dy: 364.46pt)[
    #line(start: (0pt, 0pt), end: (271.07pt, 0pt), stroke: 1.8pt + black)
  ]

  // 5. 提出記録・判定指示の下部水平仕切り線 (Y: 569.92pt, 幅: 482.14pt, 線幅: 1.8pt)
  place(top + left, dx: 56.03pt, dy: 569.92pt)[
    #line(start: (0pt, 0pt), end: (482.14pt, 0pt), stroke: 1.8pt + black)
  ]

  // 6. テーマ値の下部水平仕切り線 (Y: 669.15pt, 幅: 482.14pt, 線幅: 1.8pt)
  place(top + left, dx: 56.03pt, dy: 669.15pt)[
    #line(start: (0pt, 0pt), end: (482.14pt, 0pt), stroke: 1.8pt + black)
  ]

  // 7. 指導教員見出しの下部水平仕切り線 (Y: 715.34pt, 幅: 482.14pt, 線幅: 1.1pt)
  place(top + left, dx: 56.03pt, dy: 715.34pt)[
    #line(start: (0pt, 0pt), end: (482.14pt, 0pt), stroke: 1.1pt + black)
  ]

  // ==========================================
  // テーブル内部コンテンツ（内部罫線: 1.1pt を描画）
  // ==========================================
  place(top + left, dx: 56.03pt, dy: 158.83pt)[
    #table(
      columns: (28.19pt, 44.43pt, 70.83pt, 127.62pt, 211.07pt),
      rows: (
        34.22pt, 34.39pt, 34.20pt, 34.23pt, 34.20pt, 34.39pt,
        34.23pt, 34.20pt, 34.20pt, 34.43pt, 34.19pt, 34.21pt,
        34.20pt, 65.03pt, 46.19pt, 47.43pt
      ),
      stroke: (x, y) => {
        // 水平内線（1.1pt）
        let top-s = if (y >= 2 and y <= 5) or (y >= 7 and y <= 11) or y == 13 { 1.1pt + black } else { none }
        // 垂直内線（1.1pt）
        let left-s = if x == 1 and ((y >= 1 and y <= 5) or (y >= 7 and y <= 11)) { 1.1pt + black }
          else if x == 2 and y >= 12 and y <= 13 { 1.1pt + black }
          else if x == 3 and ((y >= 1 and y <= 5) or (y >= 7 and y <= 15)) { 1.1pt + black }
          else if x == 4 and y >= 14 and y <= 15 { 1.1pt + black }
          else { none }
        (top: top-s, bottom: none, left: left-s, right: none)
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
