#import "lib.typ": tuat-report

#show: tuat-report.with(
  cover-type: "programming-practice",
  department: "知能情報システム工学科",
  subject: "プログラミングⅠ演習",
  document-type: "演習課題",
  
  class-name: "A-P2",
  content: "第10回　文字列と文字列操作",
  teacher: "演習 太郎",
  student-id: "12345678",
  author: "農工 太郎",
)

= 課題1: 文字列の反転関数
与えられた文字列を反転して返却するプログラムを作成した。

== ソースコード
```c
#include <stdio.h>
#include <string.h>

void reverse(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        char temp = str[i];
        str[i] = str[len - 1 - i];
        str[len - 1 - i] = temp;
    }
}

int main() {
    char s[] = "Hello, Typst!";
    reverse(s);
    printf("%s\n", s);
    return 0;
}
```

== 実行結果
```text
!tsyptT ,olleH
```

== 考察
`strlen`関数を利用して文字列長を取得し、両端から文字を交換することで効率的に反転処理を実現できた。
