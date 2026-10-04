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

  // メイン表（元PDFの基準座標 X=54.42pt, Y=569.72pt）
  place(top + left, dx: 54.42pt, dy: 569.72pt)[
    #table(
      columns: (143.66pt, 127.62pt, 210.88pt),
      rows: (35.61pt, 48.82pt, 47.60pt, 47.42pt),
      stroke: (x, y) => {
        let top-s = if y == 0 or y == 2 { 1.8pt + black } else { 1.1pt + black }
        let bottom-s = if y == 3 { 1.8pt + black } else { none }
        let left-s = if x == 0 { 1.8pt + black } else { 1.1pt + black }
        let right-s = if x == 2 { 1.8pt + black } else { none }
        (top: top-s, bottom: bottom-s, left: left-s, right: right-s)
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
