#!/bin/sh
set -e # エラーが発生したら即座にスクリプトを終了

echo "--- START: Final pod install attempt (Git Clone SDK with --depth 1) ---"

# 1. Flutter SDKのダウンロード先を設定（$HOMEは安全な場所）
FLUTTER_SDK_PATH="$HOME/flutter_sdk"
FLUTTER_VERSION="stable"

# 2. SDKが存在しない場合のみダウンロード
if [ ! -d "$FLUTTER_SDK_PATH" ]; then
    echo "INFO: Cloning Flutter SDK version ${FLUTTER_VERSION} with depth 1..."
    # 🌟 あなたが提案したコマンドを使用 🌟
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
    flutter precache --ios # iOSビルドに必要なアーティファクトをダウンロード
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

echo "--- END: Pod install success ---"
exit 0