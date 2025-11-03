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
echo "INFO: pod install completed."

# 8. 認証情報ファイルの生成 (絶対パスで安全性を確保)
CREDENTIALS_PATH="/Volumes/workspace/repository/assets/your_service_account_credentials.json"
echo "INFO: Target path (Absolute Final): $CREDENTIALS_PATH"


# 環境変数が設定されているか確認
if [ -z "$FIREBASE_CREDENTIALS" ]; then
    echo "FATAL ERROR: FIREBASE_CREDENTIALS environment variable is empty or not set."
    echo "Check Xcode Cloud Secrets settings."
    exit 1
fi

# 変数の内容を、特殊文字をエスケープして安全にファイルに書き出す
printf "%s" "$FIREBASE_CREDENTIALS" > "$CREDENTIALS_PATH"

# ファイルが正しく作成されたか最終チェック
if [ -f "$CREDENTIALS_PATH" ]; then
    echo "SUCCESS: Credentials file created at $CREDENTIALS_PATH."
else
    # ファイル作成の失敗はここで確定する
    echo "FATAL ERROR: Failed to create credentials file."
    exit 1
fi

echo "--- END: Setup successful ---"
exit 0