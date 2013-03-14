# Memento パターン

* インスタンスの状態を表す役割を導入し、カプセル化の破壊に陥ることなく保存復元を行う
    * undo, redo, history, snapshot など
    * フィールドに不用意なアクセスを許してしまうと、そのクラスの内部構造に依存したコードがプログラムに散らばってしまう


# 登場人物
* Originator
    * *Gamer* クラス
    * 自分の状態を保存したいときに Memento を作る
    * 以前の Memento を渡されると、その Memento を作った時点の状態に戻る
* Memento
    * *Memento* クラス
    * Originator の内部情報をまとめる
        * wide interface
            * オブジェクトの状態をもとに戻すために必要な情報すべてが得られる
            * 広い API は Memento の内部状態をさらけ出してしまうので Originator のみが使える
        * narrow interface
            * 外部の Caretaker に見せる
            * 狭い API でできることには限りがあり、内部状態が公開されるのを防ぐ
* Caretaker
    * *Main*
    * 現在の Originator の役を保存したいときに、そのことを Originator に伝える
    * Originator から渡された Memento を保存しておく
