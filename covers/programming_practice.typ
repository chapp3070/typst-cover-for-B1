// covers/programming_practice.typ
// プログラミング演習（Programming Practice）表紙レイアウト

#let make-programming-practice-cover(
  department: "知能情報システム工学科",
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  class-name: "",
  content: "",
  teacher: "",
  student-id: "",
  author: "",
  font: ("Yu Gothic", "Meiryo", "BIZ UDPGothic", "MS Gothic", "Noto Sans CJK JP", "IPAexGothic"),
) = {
  set text(font: font, lang: "ja")

  // タイトル部（元PDFの基準座標 Y=239.47pt, 283.85pt, 332.50pt）
  place(top + center, dy: 239.47pt)[
    #text(size: 22pt, weight: "bold")[#department]
  ]
  place(top + center, dy: 283.85pt)[
    #text(size: 26pt, weight: "bold")[#subject]
  ]
  place(top + center, dy: 332.50pt)[
    #text(size: 22pt, weight: "bold")[#document-type]
  ]

  // 下部属性表
  let header-cell(body) = table.cell(
    align: center + horizon,
    [#text(weight: "bold", size: 13pt)[#body]]
  )

  let body-cell(body) = table.cell(
    align: center + horizon,
    [#text(size: 14pt)[#body]]
  )

  // ==========================================
  // 外枠と主要仕切り線（絶対に欠損しないよう明示描画）
  // ==========================================

  // 1. 最外枠矩形 (dx: 54.42pt, dy: 569.72pt, 幅: 482.16pt, 高さ: 179.45pt, 線幅: 1.8pt)
  place(top + left, dx: 54.42pt, dy: 569.72pt)[
    #rect(width: 482.16pt, height: 179.45pt, stroke: 1.8pt + black)
  ]

  // 2. 行2の下（内容と担当教員の間）の水平仕切り線 (dy: 569.72 + 35.61 + 48.82 = 654.15pt, 長さ: 482.16pt)
  place(top + left, dx: 54.42pt, dy: 654.15pt)[
    #line(start: (0pt, 0pt), end: (482.16pt, 0pt), stroke: 1.8pt + black)
  ]

  // ==========================================
  // テーブル内部コンテンツ（内部罫線: 1.1pt を描画）
  // ==========================================
  place(top + left, dx: 54.42pt, dy: 569.72pt)[
    #table(
      columns: (143.66pt, 127.62pt, 210.88pt),
      rows: (35.61pt, 48.82pt, 47.60pt, 47.42pt),
      stroke: (x, y) => {
        let top-s = if y == 1 or y == 3 { 1.1pt + black } else { none }
        let left-s = if x == 1 { 1.1pt + black } else if x == 2 and y >= 2 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: left-s, right: none)
      },
      align: center + horizon,
      
      // Row 1: クラス / 内容 ヘッダー
      header-cell([クラス]),
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 13pt)[内容]],

      // Row 2: クラス / 内容 値
      body-cell(class-name),
      table.cell(colspan: 2, align: center + horizon)[#text(size: 13.5pt)[#content]],

      // Row 3: 担当教員 / 学籍番号 / 氏名 ヘッダー
      header-cell([担当教員]),
      header-cell([学籍番号]),
      header-cell([氏名]),

      // Row 4: 担当教員 / 学籍番号 / 氏名 値
      body-cell(teacher),
      body-cell(student-id),
      body-cell(author),
    )
  ]
}
