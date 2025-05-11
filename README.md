# shopping_memo_app_flutter

買い物メモアプリです。  
商品を追加・削除できるシンプルな 2 画面構成のアプリになります。

## 開発の背景・目的

Flutter 未経験の状態から、案件参画後に少しずつ学習を進め、  
1 ヶ月経過時点でこれまでの学習を整理し、  
ゼロから自力で動くアプリを形にすることを目標に開発しました。

アプリ構成・状態管理・UI 設計などを業務内外で継続的に学びながら、  
単なる写経にとどまらず、自力で実装できる力を意識して取り組んでいます。

今後は、機能追加や `Riverpod`・`go_router` などの導入、  
Flutter の各種ウィジェットの理解も深めながら、  
より実践的なアプリ開発に取り組んでいく予定です。

## デモ画面

<p align="left">
  <img src="assets/demo.gif" width="300" />
</p>

## 機能概要

- 商品をリストに追加
- 商品をタップで削除
- 状態管理は setState を使用

## 技術構成

- Flutter 3.27.4
- Dart 3.6.2
- 対応 OS: iOS / Android
- UI 構築: Flutter 標準ウィジェット（Material Design）
- 状態管理: setState（今後、Riverpod への切り替えを検討中）
- 画面遷移: Navigator 1.0（今後、go_router への切り替えを検討中）
