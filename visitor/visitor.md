# Visitor パターン

* データ構造と処理を分離する
    * データ構造の中を渡り歩く「訪問者」に処理を任せる
        * 新しい処理を追加するときは新しい「訪問者」を作る
* accept メソッドと visit メソッドは対局関係
    * ダブルディスパッチ
* ConcreteVisitor は ConcreteElement と独立して開発できる
    * 部品としての独立性を高める
    * Open-Closed Principle
      * 既存クラスを修正せずに拡張できるようにする
* ConcreteVisitor の追加は簡単
    * 具体的な処理は ConcreteVisitor が請け負うため、ConcreteElement は修正不要
* ConcreteElement の追加は困難
    * Visitor, ConcreteVisitor すべてに visit メソッドを追加する必要がある

# 登場人物
* Visitor
    * *Visitor* クラス
    * ConcreteElement ごとに訪問を告げる visit メソッドを宣言
* ConcreteVisitor
    * *ListVisitor* クラス
    * Visitor の API を実装
        * 個々の ConcreteElement ごとの処理を記述
    * 内部状態が変化することがある
* Element
    * *Element* クラス
    * 訪問者を受け入れる accept メソッドを宣言
* ConcreteElement
    * *File*, *Directory* クラス
    * Element の API を実装する
* ObjectStructure
    * *Directory* クラス
    * Element の集合を扱う
        * ConcreteVisitor が個々の Element を扱える
