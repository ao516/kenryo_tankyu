#!/bin/sh

echo "--- START: Final pod install attempt (Flutter Path Fixed) ---"

# 1. Flutter SDKのパスをPATHに追加 (必須)
# Xcode Cloudの環境変数がこのパスを知るようにする
export FLUTTER_ROOT="/Users/aoi/develop/flutter"
export PATH="$PATH:$FLUTTER_ROOT/bin"

# 2. ルートディレクトリへ移動
cd ../.. 

# 3. Flutterの依存関係を解決 (Generated.xcconfigを生成)
echo "Running flutter pub get..."

# flutter コマンドが実行できるか確認してから実行
if command -v flutter >/dev/null 2>&1; then
    flutter pub get
else
    echo "ERROR: Flutter command still not found after setting PATH. Please check installation."
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