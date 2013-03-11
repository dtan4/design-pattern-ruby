# Decorator パターン

* 中心となるオブジェクトがあり、それに飾り付けとなる機能を被せて目的にあったオブジェクトを作る
    * スポンジケーキからショートケーキ、バースデーケーキを作る
* 飾り枠と中身を同一視する
    * 「透過的」な API
    * Composite パターンに似た再帰的構造
* 包まれるものを変更することなく、機能の追加を行うことができる
    * 飾り枠に対する要求は中身に委譲する
* java.io パッケージの BufferedReader, FileReader, InputStreamReader ...
* 小さいクラスが増えてしまう欠点


# 登場人物
* Component
    * *Display* クラス
    * 機能追加の核となる
    * デコレーション前のスポンジケーキ
* ConcreteComponent
    * *StringDisplay* クラス
    * Concrete の API を実装している
* Decorator
    * *Border* クラス
    * Component と同じ API を持ち、この Decorator が飾る Component を持つ
    * 自分が飾っている対象を知っている
* ConcreteDecorator
    * *SideBorder* クラスなど
    * 具体的な Decorator
