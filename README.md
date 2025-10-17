# 探究アーカイブ

<p align="center">
  長野県松本県ヶ丘高等学校の「探究活動」を支援するモバイルアプリ
</p>
<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase">
  <img src="https://img.shields.io/badge/Algolia-5468FF?style=for-the-badge&logo=algolia&logoColor=white" alt="Algolia">
</p>

---

## 📖 プロジェクト概要

このアプリは、長野県松本県ヶ丘高等学校の生徒・教職員向けに開発した、探究活動の成果物（ポスターや論文）をアーカイブし、閲覧・検索できるモバイルアプリです。
インストールは[こちら](https://apps.apple.com/jp/app/%E7%B8%A3%E9%99%B5%E6%8E%A2%E7%A9%B6%E3%82%A2%E3%83%BC%E3%82%AB%E3%82%A4%E3%83%96/id6738385612)から

### 開発の背景
母校では毎年、生徒が1年間かけて研究を行う「探究活動」が盛んです。しかし、その貴重な研究成果は単年度で完結してしまい、後輩たちに十分に活用されていないという課題がありました。

そこで、**「先輩の探究成果を資産として引き継ぎ、後輩たちがより良い探究活動を行う手助けをしたい」** という想いから、大学進学後に本アプリの開発に着手しました。

### 開発体制
2023年11月に発足した学生団体「探究アーカイブ制作委員会」が開発・運営を担っています。母校のOB・OG、現役生を含む8名が在籍し、学校側とも連携を取りながら開発を進めています。

---

## ✨ 主な機能

| 画面 | スクリーンショット | 説明 |
| :--- | :--- | :--- |
| **ホーム画面** | <img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/homeScreen.jpg"> | **Google Authentication**を利用し、学校指定のメールアドレスを持つユーザーのみがログインできます。ログイン後は、後輩が先輩の探究を参考にできるよう、おすすめの探究作品がアルゴリズムに基づいて表示されます。 |
| **検索画面** | <img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/searchScreen.jpg"> | キーワード検索に加え、カテゴリ、学科、年度での絞り込みが可能です。検索エンジンには**Algolia**を採用し、タイトルの一部でもヒットする高速な全文検索を実現。ユーザーの検索行動を分析し、**検索サジェスト機能**を後から追加実装するなど、継続的なUX改善を行っています。 |
| **コンテンツ画面**| <img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/resultScreen.jpg"> | 作品をタップすると**Firebase Storage**からPDFが返され、閲覧できます。一度閲覧したPDFはデバイスにキャッシュされ、オフラインでの閲覧や表示の高速化、Firestoreの通信量削減を実現しています。気に入った作品は**お気に入り登録**でき、後から簡単に見返すことができます。 |
| **履歴画面** | <img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/historyScreen.jpg"> | 過去に閲覧した作品の履歴を一覧で確認できます。閲覧履歴は**SQLite**を利用したローカルデータベースに保存しており、軽快なアクセスが可能です。 |

---

## 🛠️ 技術スタック

- **フロントエンド**: Flutter, Dart
- **状態管理**: Riverpod
- **画面遷移**: GoRouter
- **バックエンド**:
  - **データベース**: Firestore, SQLite (ローカル)
  - **検索エンジン**: Algolia
  - **ストレージ**: Firebase Storage
  - **認証**: Firebase Authentication
- **その他**:
  - **CI/CD・自動化**: Google Apps Script (スプレッドシートからのデータアップロード)
  - **デザイン**: Figma (Material Design 3準拠)

---

## 📂 ディレクトリ構成

コードの保守性を高め、後輩がスムーズに開発を引き継げるよう、責務を明確に分離したフォルダ構成を意識しています。

| ディレクトリ | 説明 |
| :--- | :--- |
| `assets/` | アプリ内で使用する画像アセット |
| `lib/components/` | 共通利用する自作ウィジェット（コンポーネント） |
| `lib/constant/` | アプリ固有の定数や`Enum`の定義 |
| `lib/pages/` | 各画面のUI（`body`部分）を配置 |
| `lib/models/` | `freezed`で生成したデータモデルを管理 |
| `lib/providers/` | `Riverpod`で定義した`Provider`を管理 |
| `lib/service/` | FirestoreやAlgoliaなど、外部サーバーとの通信処理を記述 |
| `lib/db/` | `SQLite`や`SharedPreferences`など、ローカルDBに関する処理を記述 |
| `router.dart` | `GoRouter`による画面遷移の定義 |

---

## 💡 開発で意識したこと

- **ユーザー体験(UX)の追求**: 単に機能を実装するだけでなく、ユーザーが「どうすれば使いやすいか」を常に考えて開発を進めました。リリース後も検索ログを分析し、ユーザーが目的の作品に辿り着けていない課題を発見。カテゴリをサジェストする機能を追加し、体験価値の向上に繋げました。

- **保守性と拡張性**: 現在は私がメインで開発していますが、将来的にプロジェクトを離れても後輩が改修しやすいよう、ファイル名やフォルダ構造の設計に気を配りました。

---

## 🚀 今後の展望

今後は、このアプリのモデルをより柔軟にし、探究活動を推進する他の学校へも導入できるよう展開していくことを検討しています。また、ログイン機構の強化や、生徒間のコミュニケーションを活性化させるSNS機能の追加なども視野に入れています。