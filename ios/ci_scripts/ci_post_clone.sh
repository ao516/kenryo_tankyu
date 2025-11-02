#!/bin/sh
set -e # エラーが発生したら即座にスクリプトを終了

echo "--- START: Final pod install attempt (Git Clone SDK with --depth 1) ---"

# 1. Flutter SDKのダウンロード先を設定（$HOMEは安全な場所）
FLUTTER_SDK_PATH="$HOME/flutter_sdk"
FLUTTER_VERSION="stable"

# 2. SDKが存在しない場合のみダウンロード
if [ ! -d "$FLUTTER_SDK_PATH" ]; then
    echo "INFO: Cloning Flutter SDK version ${FLUTTER_VERSION} with depth 1..."
    git clone https://github.com/flutter/flutter.git -b ${FLUTTER_VERSION} --depth 1 "$FLUTTER_SDK_PATH"
fi

# 3. FlutterのPATHを設定
export PATH="$PATH:$FLUTTER_SDK_PATH/bin"
echo "INFO: Flutter PATH set: $FLUTTER_SDK_PATH/bin"

# 4. ルートディレクトリへ移動
cd ../.. 

# 5. Flutterの依存関係を解決 (Generated.xcconfigを生成)
echo "Running flutter pub get and precache..."
if command -v flutter >/dev/null 2>&1; then
    flutter precache --ios # iOSビルドにzw必要なアーティファクトをダウンロード
    flutter pub get       # Generated.xcconfigを生成
else
    echo "FATAL ERROR: Flutter command not found even after cloning and setting PATH."
    exit 1
fi

# 6. iosディレクトリへ移動 (Podfileがある場所)
cd ios 

echo "Current working directory is: $(pwd)"
echo "Executing pod install..."

# 7. pod install を実行
/usr/local/bin/pod install --repo-update --clean-install

# 6. 認証情報ファイルの生成 (ビルド時に必要なファイルを一時的に作成)
echo "INFO: Creating service account credentials file from environment variable..."

# ファイルを作成するパス（Xcodeがアセットとして参照するパス）
CREDENTIALS_PATH="../assets/your_service_account_credentials.json"

# FIREBASE_CREDENTIALS環境変数の内容をファイルに書き込む
# sedコマンドで改行文字を処理する必要がある場合があります
if [ -n "$FIREBASE_CREDENTIALS" ]; then
    echo "$FIREBASE_CREDENTIALS" | base64 -d > "$CREDENTIALS_PATH"
    echo "SUCCESS: Credentials file created at $CREDENTIALS_PATH"
else
    # 環境変数が設定されていない場合、ビルドを失敗させる
    echo "FATAL ERROR: FIREBASE_CREDENTIALS environment variable is not set."
    exit 1
fi

echo "--- END: Setup successful ---"
exit 0
