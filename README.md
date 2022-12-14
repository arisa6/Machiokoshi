# Machiokoshi

## サイト概要
食材を通して埋もれた日本食の魅力を全国に発信するサイトです。
特産品の産地地消を全国に広げることで効率的な生産や品質改善に繋がり、根本的な食品ロス削減の意図を持つECサイトです。

### サイトテーマ
テーマは、販売サイトを持たない農家と特産品を探す消費者のマッチングができるECサイトです。
特定の地域でしか食べることのできない特産品作る生産者と関わることで食材への関心が高まり、その地域全体を知るきっかけを作ることができると考えます。
そして、地域と繋がる機会を生み出し地域活性化つなげるセレクトECサイトです。

![readme(1)](https://user-images.githubusercontent.com/105696988/190893144-6346218b-4a70-4613-a61c-cc677807ad48.png)
![readme(2)](https://user-images.githubusercontent.com/105696988/190893150-9a151a29-ef44-44f2-b472-bea576239332.png)
![readme(3)](https://user-images.githubusercontent.com/105696988/190893153-1ba193b9-0c1e-4cfa-a946-8887e9aca793.png)


### テーマを選んだ理由
テーマを選んだ理由は3つあります。
- 生産者×特産品を求める消費者を繋げる。
- あまり知られていない特産品を広めたい生産者×マイナー好きな消費者を繋げる。
- 観光地を盛り上げたい地元民×行ったことのない場所へ旅したい消費者を繋げる。

販売サイトを持たない生産者と良い食材がほしい消費者のマッチングができるECサイトがあれば生活が豊かになると考え選びました。
また、規格外の食材で発生する食品ロス削減を中心に地方の持続可能な発展を図りたいと考え、地産地消をより多くの地域に拡散し、
その特産品で日本中の魅力を発信することで地域活性に繋がると考え選びました。

### ターゲットユーザ
- 作物を広めたい生産者
- 旬やマイナーなものなど食にこだわりを持った30代~50代
- 産地直送の新鮮な食材を探す消費者
- 生産者との距離が近く安心して食を楽しみたい消費者
- 食品ロスへの意識を持つ消費者

### 主な利用シーン
- ネットショッピングするとき
- 生産者が出品したい商品を販売するとき
- 旬の商品を生産者の意見を見ながら選びたいとき
- 新鮮な食材を食べたいとき
- 以前に訪れた地での特産物を手に入れたいとき

## 設計書
![PF_ER図 drawio](https://user-images.githubusercontent.com/105696988/191326629-064beedc-0691-45b7-92b2-040e5d5198cc.png)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用技術
- Ruby 3.1.2
- Ruby on Rails 6.1.6
- MySQL 
- Nginx
- Puma
- AWS
- CircleCi CI/CD

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 画像投稿(refile)
- ページネーション機能(kaminari)
- 数値と文字列を紐付け(enum)
- ステータス機能
- 決済機能
- 注文・発送機能
- カート機能

## 使用素材
*商品画像*
- photp AC (<https://www.photo-ac.com/>)
- depositphotos (<https://jp.depositphotos.com/stock-photos/%E8%BE%B2%E6%A5%AD.html>)
