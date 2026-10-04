// covers/programming_report.typ
// プログラミング演習 定期レポート（Programming Practice Periodic Report）表紙レイアウト
// title.pdf 原本に100%一致する精密レイアウト

#let make-programming-report-cover(
  department: "知能情報システム工学科",
  report-title: "レポート",
  tasks: (
    (num: "1", date: "", summary: ""),
    (num: "2", date: "", summary: ""),
    (num: "3", date: "", summary: ""),
    (num: "4", date: "", summary: ""),
    (num: "", date: "", summary: ""),
    (num: "", date: "", summary: ""),
  ),
  submissions: (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  ),
  eval-instruction: "",
  subject: "プログラミングⅠ演習",
  teacher: "",
  grade: "1",
  semester: "前期",
  credits: "2",
  theme-number: "",
  theme: "",
  student-id: "",
  author: "",
  font-gothic: ("Yu Gothic", "Meiryo", "BIZ UDPGothic", "MS Gothic"),
  font-mincho: ("MS Mincho", "Yu Mincho", "BIZ UDPMincho"),
) = {
  // ゴシック体ヘッダー用（太字ウェイトを明確に適用）
  let gothic(body, weight: "bold", size: 13pt) = text(font: font-gothic, weight: weight, size: size)[#body]
  // 明朝体データ用（通常ウェイト）
  let mincho(body, size: 12pt) = text(font: font-mincho, weight: "regular", size: size)[#body]

  // タイトル部（原本座標 Y=63.65pt）
  place(top + center, dy: 63.65pt)[
    #text(font: font-gothic, size: 22pt, weight: "bold")[#department #h(1.2em) #report-title]
  ]

  // タスクリストの6行補完
  let default-tasks = (
    (num: "1", date: "", summary: ""),
    (num: "2", date: "", summary: ""),
    (num: "3", date: "", summary: ""),
    (num: "4", date: "", summary: ""),
    (num: "", date: "", summary: ""),
    (num: "", date: "", summary: ""),
  )
  let task-list = tasks + default-tasks.slice(calc.min(tasks.len(), 6))

  // 提出記録リストの5行補完
  let default-subs = (
    (type: "初", date: "", deadline: ""),
    (type: "再", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
    (type: "", date: "", deadline: ""),
  )
  let sub-list = submissions + default-subs.slice(calc.min(submissions.len(), 5))

  // ==========================================
  // 外枠と主要仕切り線（1.8pt の太線で明示描画）
  // ==========================================
  
  // 1. 最外枠矩形 (dx: 49.83pt, dy: 104.43pt, 幅: 503.95pt, 高さ: 633.35pt, 線幅: 1.8pt)
  place(top + left, dx: 49.83pt, dy: 104.43pt)[
    #rect(width: 503.95pt, height: 633.35pt, stroke: 1.8pt + black)
  ]

  // 2. 課題実施記録・提出記録と判定・指示の間の垂直仕切り線 (X: 355.50pt, Y: 104.43pt〜561.93pt, 長さ: 457.50pt)
  place(top + left, dx: 355.50pt, dy: 104.43pt)[
    #line(start: (0pt, 0pt), end: (0pt, 457.50pt), stroke: 1.8pt + black)
  ]

  // 3. 課題実施記録と提出記録の間の水平仕切り線 (X: 49.83pt〜355.50pt, Y: 348.68pt, 長さ: 305.67pt)
  place(top + left, dx: 49.83pt, dy: 348.68pt)[
    #line(start: (0pt, 0pt), end: (305.67pt, 0pt), stroke: 1.8pt + black)
  ]

  // 4. 上中段と下部情報1の間の水平仕切り線 (X: 49.83pt〜553.78pt, Y: 561.93pt, 長さ: 503.95pt)
  place(top + left, dx: 49.83pt, dy: 561.93pt)[
    #line(start: (0pt, 0pt), end: (503.95pt, 0pt), stroke: 1.8pt + black)
  ]

  // 5. 下部情報1と下部情報2の間の水平仕切り線 (X: 49.83pt〜553.78pt, Y: 638.55pt, 長さ: 503.95pt)
  place(top + left, dx: 49.83pt, dy: 638.55pt)[
    #line(start: (0pt, 0pt), end: (503.95pt, 0pt), stroke: 1.8pt + black)
  ]

  // 6. 下部情報2のテーマ情報と学籍情報の間の垂直仕切り線 (X: 310.10pt, Y: 638.55pt〜737.78pt, 長さ: 99.23pt)
  place(top + left, dx: 310.10pt, dy: 638.55pt)[
    #line(start: (0pt, 0pt), end: (0pt, 99.23pt), stroke: 1.1pt + black)
  ]

  // ==========================================
  // 各ブロックのテーブルコンテンツ（内部罫線: 1.1pt を描画）
  // ==========================================

  // 1. 課題実施記録テーブル (dx: 49.83pt, dy: 104.43pt, 幅: 305.67pt, 高さ: 244.25pt)
  place(top + left, dx: 49.83pt, dy: 104.43pt)[
    #table(
      columns: (30.99pt, 121.86pt, 152.82pt),
      rows: (31.20pt, 30.62pt, 30.60pt, 30.40pt, 30.40pt, 30.62pt, 30.40pt, 30.01pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 or y == 2 { 1.1pt + black } else if y >= 3 and y <= 6 { (paint: black, thickness: 1.1pt, dash: (2.2pt, 0.8pt)) } else if y == 7 { (paint: black, thickness: 1.1pt, dash: (1.5pt, 0.6pt)) } else { none }
        let left-s = if (x == 1 or x == 2) and y >= 1 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: left-s, right: none)
      },
      table.cell(colspan: 3)[#gothic("課題実施記録", weight: "bold", size: 15pt)],
      [], [#gothic("年月日", weight: "bold", size: 13pt)], [#gothic("概要", weight: "bold", size: 13pt)],
      ..task-list.slice(0, 6).map(it => (
        mincho(it.at("num", default: ""), size: 12pt),
        mincho(it.at("date", default: ""), size: 12pt),
        mincho(it.at("summary", default: ""), size: 12pt),
      )).flatten(),
    )
  ]

  // 2. 判定・指示テーブル (dx: 355.50pt, dy: 104.43pt, 幅: 198.28pt, 高さ: 457.50pt)
  place(top + left, dx: 355.50pt, dy: 104.43pt)[
    #table(
      columns: (198.28pt,),
      rows: (31.20pt, 426.30pt),
      align: (center + horizon, left + top),
      stroke: (x, y) => {
        let top-s = if y == 1 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: none, right: none)
      },
      [#gothic("判定・指示", weight: "bold", size: 13.5pt)],
      [
        #set text(font: font-mincho, weight: "regular", size: 11pt)
        #pad(x: 10pt, y: 10pt)[#eval-instruction]
      ],
    )
  ]

  // 3. レポート提出記録テーブル (dx: 49.83pt, dy: 348.68pt, 幅: 305.67pt, 高さ: 213.25pt)
  place(top + left, dx: 49.83pt, dy: 348.68pt)[
    #table(
      columns: (30.99pt, 137.06pt, 137.62pt),
      rows: (31.20pt, 30.42pt, 30.60pt, 30.60pt, 30.40pt, 30.22pt, 29.81pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 or y == 2 { 1.1pt + black } else if y >= 3 and y <= 5 { (paint: black, thickness: 1.1pt, dash: (2.2pt, 0.8pt)) } else { none }
        let left-s = if (x == 1 or x == 2) and y >= 1 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: left-s, right: none)
      },
      table.cell(colspan: 3)[#gothic("レポート提出記録", weight: "bold", size: 15pt)],
      [], [#gothic("提出年月日", weight: "bold", size: 13pt)], [#gothic("期限年月日", weight: "bold", size: 13pt)],
      ..sub-list.slice(0, 5).map(it => (
        mincho(it.at("type", default: ""), size: 12pt),
        mincho(it.at("date", default: ""), size: 12pt),
        mincho(it.at("deadline", default: ""), size: 12pt),
      )).flatten(),
    )
  ]

  // 4. 下部情報1テーブル（科目名、教員、学年、学期、単位） (dx: 49.83pt, dy: 561.93pt, 幅: 503.95pt, 高さ: 76.62pt)
  place(top + left, dx: 49.83pt, dy: 561.93pt)[
    #table(
      columns: (199.05pt, 137.64pt, 52.83pt, 63.80pt, 50.63pt),
      rows: (31.20pt, 45.42pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 { 1.1pt + black } else { none }
        let left-s = if x >= 1 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: left-s, right: none)
      },
      [#gothic("科目名", weight: "bold", size: 13pt)],
      [#gothic("テーマ担当教員", weight: "bold", size: 13pt)],
      [#gothic("学年", weight: "bold", size: 13pt)],
      [#gothic("学期", weight: "bold", size: 13pt)],
      [#gothic("単位", weight: "bold", size: 13pt)],

      [#mincho(subject, size: 13.5pt)],
      [#mincho(teacher, size: 15pt)],
      [#mincho(str(grade), size: 17pt)],
      [#mincho(semester, size: 17pt)],
      [#mincho(str(credits), size: 17pt)],
    )
  ]

  // 5. 下部情報2テーブル（テーマ番号・テーマ名、学籍番号・氏名） (dx: 49.83pt, dy: 638.55pt, 幅: 503.95pt, 高さ: 99.23pt)
  place(top + left, dx: 49.83pt, dy: 638.55pt)[
    #table(
      columns: (260.27pt, 243.68pt),
      rows: (31.20pt, 68.03pt),
      align: center + horizon,
      stroke: (x, y) => {
        let top-s = if y == 1 { 1.1pt + black } else { none }
        (top: top-s, bottom: none, left: none, right: none)
      },
      [
        #grid(
          columns: (1fr, 1fr),
          align: center + horizon,
          [#gothic("テーマ番号", weight: "bold", size: 13pt)],
          [#gothic("テーマ名", weight: "bold", size: 13pt)],
        )
      ],
      [
        #grid(
          columns: (1fr, 1fr),
          align: center + horizon,
          [#gothic("学籍番号", weight: "bold", size: 13pt)],
          [#gothic("氏　名", weight: "bold", size: 13pt)],
        )
      ],

      [
        #set text(font: font-mincho, weight: "regular", size: 13.5pt)
        #if theme-number != "" [#theme-number \ ]
        #if theme != "" [#theme]
      ],
      [
        #set text(font: font-mincho, weight: "regular", size: 17.5pt)
        #student-id #h(1.2em) #author
      ],
    )
  ]
}
