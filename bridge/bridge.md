# Strategy パターン

* 機能と実装を分離する
    * 機能のクラス階層
        * *display.rb*
    * 実装のクラス階層
        * *display-impl.rb*
* Template Method パターンは実装のクラス階層を表現
    * 機能を追加したい場合、ひとつのクラス階層に混同する
* 機能を追加したい場合は、機能のクラス階層にクラスを追加する
    * 実装のクラス階層は修正不要
    * 追加した昨日はすべての実装で利用できる
* 実装を追加したい場合は、実装のクラス階層にクラスを追加する
    * 例）OS によって実装を変化させる

## 登場人物
* Abstraction（抽象化）
    * *Display* クラス
    * 機能のクラス階層は「実装」を表すインスタンスをフィールドに持つ
        * 2つのクラス階層の橋渡し (Bridge)
        * Implementor に委譲
* RefinedAbstraction（改善した抽象化）
    * *CountDisplay* クラス
* Implementor（実装者）
    * *DisplayImpl* クラス
* ConcreteImplementor（具体的な実装者）
    * *StringDisplayImpl* クラス
