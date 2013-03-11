# Composite パターン

* 容器と中身を同一視
    * ディレクトリとファイルをまとめてディレクトリエントリ
* 入れ子構造、再帰的構造を作る

## 登場人物
* Leaf
    * *File* クラス
    * 中身を表す
* Composite
    * *File* クラス
    * Leaf や Composite を格納できる
* Component
    * *File* クラス
    * Leaf と Composite を同一視する
* Client
    * *Main* クラス
* ある Leaf または Composite のみで使えるメソッドを定義したい
    * Component ではエラーを投げる実装、Leaf or Composite で意味のある実装にオーバライド
