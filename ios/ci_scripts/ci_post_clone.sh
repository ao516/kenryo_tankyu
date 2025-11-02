#!/bin/sh

echo "--- START: Final pod install attempt (CI Environment Paths) ---"

# 1. 既知の環境変数からFlutterのパスを特定し、PATHに追加
#    ローカルパスやHomebrewのPATH設定は全て削除します

# CI環境でFlutter SDKの場所を示す可能性がある環境変数をチェック
FLUTTER_SDK_DIR=""
if [ -n "$FLUTTER_ROOT" ]; then
    FLUTTER_SDK_DIR="$FLUTTER_ROOT"
elif [ -n "$FLUTTER_HOME" ]; then
    FLUTTER_SDK_DIR="$FLUTTER_HOME"
fi

# SDKのbinディレクトリをPATHに追加
if [ -n "$FLUTTER_SDK_DIR" ]; then
    export PATH="$PATH:$FLUTTER_SDK_DIR/bin"
    echo "INFO: Found Flutter SDK via environment variable: $FLUTTER_SDK_DIR"
else
    # 環境変数が未設定の場合、一般的な場所を試す
    export PATH="$PATH:$HOME/Library/Flutter/bin"
    echo "INFO: Attempting common Flutter path: $HOME/Library/Flutter/bin"
fi


# 2. ルートディレクトリへ移動
cd ../.. 

# 3. Flutterの依存関係を解決 (Generated.xcconfigを生成)
echo "Running flutter pub get..."

# flutter コマンドが実行できるかチェック
if command -v flutter >/dev/null 2>&1; then
    flutter pub get
else
    echo "FATAL ERROR: Flutter command still not found. Check if Flutter SDK is set up in Xcode Cloud."
    exit 1
fi

# 4. iosディレクトリへ移動 (Podfileがある場所)
cd ios 

echo "Current working directory is: $(pwd)"
echo "Executing /usr/local/bin/pod install..."

# 5. pod install を実行
/usr/local/bin/pod install --repo-update --clean-install

# 失敗チェック
if [ $? -ne 0 ]; then
    echo "FATAL ERROR: pod install failed."
    exit 1
fi

echo "--- END: Pod install success ---"
exit 0