# 探究アーカイブ kenryo_tankyu

長野県松本県ヶ丘高等学校の探究活動を支援するために作成したアプリです。

PDFで保管された先輩の探究作品のpdfを閲覧、検索、保存することができます。


## 主な機能

|画面|スクリーンショット|
|-|-|
|**ホーム画面**<br>松本県ヶ丘高校の生徒と職員しか使えないよう、特定のメールアドレスの人しか新規登録・ログインできないように制限してあります。ログインにはGoogle Authenticationを使用しています。ログイン後は、おすすめの探究活動やコンテンツが表示されます。おすすめは3日に一度更新され、後輩が先輩の探究を参考にできるよう支援します。|<img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/homeScreen.jpg">|
|**コンテンツ画面**<br>探究活動の詳細な内容（ポスターや論文など）、画像、関連資料を閲覧できます。見たい作品をクリックすると、Firebase StorageからPDFが返されるように設計されています。閲覧したPDFはキャッシュに保管され、次回以降はローカルから取得することで、Firestoreのランニングコスト削減とオフライン閲覧を可能にしています。また、気に入った探究作品にハートマークを押すことでお気に入り登録ができ、一覧として見たり検索結果で上位に表示させることができます。情報の修正の提案など、問題のあるPDFをユーザーが報告できる機能も実装しています。|<img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/resultScreen.jpg">|
|**履歴画面**<br>ユーザーが過去に閲覧した探究活動の履歴を一覧で確認でき、再度アクセスしやすくなっています。閲覧履歴はSQLiteのローカルDBを通じてデバイスに保管され、アプリ上ではそのキャッシュを参照して一覧を表示しています。|<img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/historyScreen.jpg">|
|**検索画面**<br>キーワードのみならず、カテゴリ、学科、入学年度などを絞った高度な検索が可能です。タイトルの一部分を検索したときもヒットされるよう、Algoliaを使用しており、Firestoreと同期されるように設定してあります。リリース後、ユーザーフィードバックに基づき検索サジェスト機能を追加し、ユーザー体験を追求した継続的な改善を行いました。|<img width="700" src="https://aoi-portfolio-woad.vercel.app/appScreenshot/searchScreen.jpg">|


## 使用している外部サービス

- Firebase関連
  - Firestore
  -- 探究作品のメタ情報（作成者やカテゴリ、いいねの数など）を保存
  - Firebase storage
  -- 探究作品のpdfを保管（firestoreにdocumentIDを保管しており、そのIDと一致するファイル名を参照させています）
  - Firebase authorization
  -- Googleのログイン認証に使用しています

- Algolia
  - Firebase ExtensionsでSearch Firestore with Algoliaを使用してFirestoreと同期させています
- MySQL
  - SqfLiteパッケージを使用してローカルDBにアクセスしています
