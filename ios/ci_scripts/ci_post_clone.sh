#!/bin/sh
set -e

# Flutter SDKのインストールとPATH設定
FLUTTER_SDK_PATH="$HOME/flutter_sdk"
FLUTTER_VERSION="stable"
FLUTTER_BIN="$FLUTTER_SDK_PATH/bin"

echo "--- START: Setup Flutter and Pods ---"

# 1. SDKのクローン（存在しなければ実行）
if [ ! -d "$FLUTTER_SDK_PATH" ]; then
    echo "INFO: Cloning Flutter SDK (${FLUTTER_VERSION}, depth 1)..."
    git clone https://github.com/flutter/flutter.git -b ${FLUTTER_VERSION} --depth 1 "$FLUTTER_SDK_PATH"
fi

# 2. Flutter PATHを設定
export PATH="$PATH:$FLUTTER_BIN"
echo "INFO: PATH set for $FLUTTER_BIN"

# 3. リポジトリのルートへ移動
cd $CI_WORKSPACE

# 4. Flutter依存関係の解決
echo "INFO: Running flutter pub get and precache..."
if command -v flutter >/dev/null 2>&1; then
    flutter precache --ios
    flutter pub get
else
    echo "FATAL ERROR: Flutter command not found."
    exit 1
fi

# 5. Podfileディレクトリへ移動し、インストール
cd ios
echo "INFO: Executing pod install in $(pwd)..."
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
