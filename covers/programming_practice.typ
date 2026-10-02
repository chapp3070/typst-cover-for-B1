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
  font: ("Yu Gothic", "Meiryo", "MS Gothic", "BIZ UDPGothic", "Noto Sans CJK JP", "IPAexGothic"),
) = {
  set text(font: font, lang: "ja")

  // タイトル部（元PDFの基準座標 Y=239.47pt, 283.85pt, 332.50pt）
  place(top + center, dy: 239.47pt)[
    #text(size: 20pt, weight: "bold")[#department]
  ]
  place(top + center, dy: 283.85pt)[
    #text(size: 24pt, weight: "bold")[#subject]
  ]
  place(top + center, dy: 332.50pt)[
    #text(size: 20pt, weight: "bold")[#document-type]
  ]

  // 下部属性表
  let header-cell(body) = table.cell(
    align: center + horizon,
    [#text(weight: "bold", size: 11pt)[#body]]
  )

  let body-cell(body) = table.cell(
    align: center + horizon,
    [#text(size: 11pt)[#body]]
  )

  // メイン表（元PDFの基準座標 X=54.42pt, Y=569.72pt）
  place(top + left, dx: 54.42pt, dy: 569.72pt)[
    #table(
      columns: (143.66pt, 127.62pt, 210.88pt),
      rows: (35.61pt, 48.82pt, 47.60pt, 47.42pt),
      stroke: 0.7pt + black,
      align: center + horizon,
      
      // Row 1: クラス / 内容 ヘッダー
      header-cell([クラス]),
      table.cell(colspan: 2, align: center + horizon)[#text(weight: "bold", size: 11pt)[内容]],

      // Row 2: クラス / 内容 値
      body-cell(class-name),
      table.cell(colspan: 2, align: center + horizon)[#text(size: 11pt)[#content]],

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
