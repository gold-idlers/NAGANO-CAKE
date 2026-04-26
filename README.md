# NAGANO-CAKE

長野県のケーキ屋さんをモデルにしたECサイトです。顧客向けのショッピング機能と、管理者向けの運営管理機能を備えています。

## 技術スタック

| カテゴリ | 使用技術 |
|---|---|
| 言語 | Ruby 3.3.6 |
| フレームワーク | Ruby on Rails 8.1.3 |
| データベース | SQLite3 |
| フロントエンド | Hotwire (Turbo + Stimulus), Importmap |
| ページネーション | Kaminari |
| 認証 | has_secure_password (bcrypt) |
| ファイルアップロード | Active Storage |

## 機能一覧

### 顧客側

- 会員登録 / ログイン / ログアウト
- パスワードリセット（メール送信）
- 商品一覧・詳細閲覧
- カート操作（追加・数量変更・削除）
- 注文（配送先選択・支払方法選択・確認画面）
- 注文履歴確認
- マイページ（会員情報編集・退会）
- 配送先住所の管理（追加・編集・削除）

### 管理者側

- 管理者ログイン / ログアウト
- 商品管理（登録・編集・公開/非公開）
- ジャンル管理（登録・編集）
- 顧客管理（一覧・詳細・編集・有効/無効切替）
- 注文管理（一覧・詳細・ステータス更新）
- 注文明細の製造ステータス更新

## セットアップ

```bash
# リポジトリをクローン
git clone <repository-url>
cd NAGANO-CAKE

# 依存関係のインストール
bundle install

# データベースの作成・マイグレーション・シードデータ投入
bin/rails db:create db:migrate db:seed

# サーバー起動
bin/dev
```

ブラウザで `http://localhost:3000` を開いてください。

## テスト用アカウント

シードデータを投入すると以下のアカウントで動作確認できます。

### 管理者

| メールアドレス | パスワード |
|---|---|
| admin@example.com | password |

管理者ページ: `http://localhost:3000/admin`

### 顧客

| メールアドレス | パスワード |
|---|---|
| test1@example.com | password |
| test2@example.com | password |
| test3@example.com | password |
| test4@example.com | password |
| test5@example.com | password |

## テスト実行

```bash
bin/rails test
bin/rails test:system
```

## コード品質チェック

```bash
bin/rubocop
bin/brakeman
```

## データベース構成

| テーブル | 概要 |
|---|---|
| customers | 顧客情報 |
| admins | 管理者情報 |
| genres | 商品ジャンル |
| items | 商品 |
| cart_items | カート内商品 |
| orders | 注文ヘッダ |
| order_details | 注文明細 |
| addresses | 配送先住所 |
| sessions | セッション管理 |
