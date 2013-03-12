# Chain of Responsibility パターン

* 複数のオブジェクトを鎖 (Chain) のようにつなぎ、その鎖を渡り歩いて目的のオブジェクトを決定する
    * 窓口のたらい回し
    * このパターンでないと、処理の割り振りを行う中央集権的オブジェクトが必要になる
        * Client に担当させるのはよろしくない
* 要求側と処理側の結びつきを弱められる
    * 双方の独立性を高められる
* 動的に連鎖形態を変化することができる
    * GUI ウインドウにコンポーネントを配置する場合
* ConcreteHandler は自分の仕事のみに集中できる
    * 処理できなかったらあっさり次の ConcreteHandler に渡す
* 処理速度は遅くなる
    * トレードオフ


## 登場人物
* Handler
    * *Support* クラス
    * 要求を処理する API を定める
    * 次の Handler を保持しておき、自分で処理できないものは次の人にまわす
* ConcreteHandler
    * *NoSupport*, *LimitSupport*, *OddSupport*, *SpecialSupport* クラス
    * 要求を処理する具体的な役
* Client
    * *Main* クラス
    * 最初の ConcreteHandler に要求を出す
