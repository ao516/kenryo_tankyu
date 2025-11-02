#!/bin/sh

echo "--- START: Final pod install attempt (Flutter ready) ---"

# 1. ルートディレクトリへ移動 ($CI_PRIMARY_REPO_PATH)
# スクリプトは ios/ci_scripts で実行されているため、親の親ディレクトリへ移動 (cd ../..)
cd ../.. 

# 2. Flutterのビルド準備 (Generated.xcconfigを生成するため)
echo "Running Flutter pub get and clean..."
flutter pub get
flutter clean

# 3. iosディレクトリへ移動 (Podfileがある場所)
cd ios 

echo "Current working directory is: $(pwd)"
echo "Executing /usr/local/bin/pod install..."

# 4. pod install を実行
/usr/local/bin/pod install --repo-update --clean-install

# 失敗チェック
if [ $? -ne 0 ]; then
    echo "FATAL ERROR: pod install failed."
    exit 1
fi

echo "--- END: Pod install success ---"
exit 0