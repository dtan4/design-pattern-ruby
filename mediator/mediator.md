# Mediator パターン

* メンバーは相談役だけに報告し、メンバーへの指示は相談役だけからくる
    * メンバー同士の干渉はしない
* 相談役はメンバーからの報告を元に大局的判断を行い、各メンバーに指示を出す


# 登場人物
* Mediator
    * Colleague と通信を行なって、調整を行うための API を定める
* ConcreteMediator
    * Mediator の API を実装し、実際の調整を行う
* Colleague
    * Mediator と通信を行う API を定める
* ConcreteColleague
    * Colleague の API を実装

# *** Not implemented! ***
