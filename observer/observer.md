# Observer パターン

* 観察対象の状態が変化する、観察者に対して通知される
* 状態変化に応じた処理を記述するときに有効
* ConcreteObserver を設計するときには update の呼び出し順が変わっても問題が起きないようにする必要がある
    * 各クラスの独立性が保たれていればあまり混乱しない
* Subject が update を呼ぶきっかけが他クラスから来る場合もある
    * 無限ループに陥る可能性がある
    * Observer に現在 Subject から通知されている最中かどうか表すフラグをもたせる
* Observer は能動的に観察するのではなく、Subject から通知されるのを受動的に待っている
    * Publish-Subscribe パターンと呼ばれる
* MVC の Model と View の関係は Subject と Observer の関係に対応


# 登場人物
* Subject
    * *NumberGenerator* クラス
    * 観察される側
    * Observer を登録するメソッドと削除するメソッドを持つ
* ConcreteSubject
    * *RandomNumberGenerator* クラス
    * 状態が変化したら、そのことを登録されている Observer に伝える
* Observer
    * *Observer* クラス
    * Subject から状態変化を教えてもらう役
* ConcreteObserver
    * *DigitObserver*, *GraphObserver* クラス
    * update メソッドが呼び出されると、そのメソッド内で Subject の現在状態を取得する
