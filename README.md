# README

# アプリケーション名
###*Music Square*

# 概要
Music Squareは音楽の好きな人たちが交流・情報交換・イベント作成のできるアプリケーションです。 アプリケーション内には好きなアーティストごとに掲示板が用意されています。
自分自身でイベントを作成することもできますので、ユーザー同士で交流・情報交換を行ってください。

# バージョン情報
Ruby 2.6.5
Rails 5.2.4.1

# 機能一覧

- ログイン機能
    - SNSログイン機能（twitter,facebook,instagram）
- ユーザー登録機能
    - 名前、メールアドレス、パスワード必須。
- ユーザーフォロー機能
- 掲示板作成・編集・削除機能
    - 管理人のみ。
    - カテゴリラベル追加機能。
- 掲示板お気に入り機能
- 掲示板へのコメント投稿機能
    - 掲示板へのコメントお気に入り機能
- イベント作成・編集・削除機能
    - イベントラベル追加機能
- イベント参加表明機能
- イベントへのコメント投稿機能
    - イベントへのコメントお気に入り機能

# カタログ設計
https://docs.google.com/spreadsheets/d/1dJhQ_BB5qmhHEaP-dJf8tWmuZ_pMsdKY6asXO23vFPA/edit#gid=0
# テーブル定義
https://docs.google.com/spreadsheets/d/1dJhQ_BB5qmhHEaP-dJf8tWmuZ_pMsdKY6asXO23vFPA/edit#gid=1260949863
# ER図
https://docs.google.com/spreadsheets/d/1dJhQ_BB5qmhHEaP-dJf8tWmuZ_pMsdKY6asXO23vFPA/edit#gid=441423570
# 画面遷移図
https://docs.google.com/spreadsheets/d/1dJhQ_BB5qmhHEaP-dJf8tWmuZ_pMsdKY6asXO23vFPA/edit#gid=1802698256
# ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1dJhQ_BB5qmhHEaP-dJf8tWmuZ_pMsdKY6asXO23vFPA/edit#gid=91892871
# 使用予定Gem
- carrierwave
- devise
- kaminari
