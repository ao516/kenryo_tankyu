# 探究アーカイブ kenryo_tankyu

Flutterで作成したアプリが利用できる状況であれば、特に他に必要な環境構築はございません。


- FlutterSDKのインストールとパスの開通

- AndroidStudioのインストール、エミュレーターの起動

- main.dartを実行

をしていただければ実行できると思います。
実行できないなどございましたらご連絡ください。
(もしかしたらFirebaseAuthorizationのSHA-1設定が必要になるかもしれません。その場合は一時的にログイン認証機能を解除した状態で再提出したいと思います。)


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
