#!/bin/sh
set -e # エラーが発生したら即座にスクリプトを終了

echo "--- START: Final pod install attempt (brew install flutter) ---"

# 1. HomebrewのPATHを強制的に追加 (Homebrewでインストールされたツールを使えるようにする)
# このPATH設定が、 'flutter: command not found' と、brewの権限エラーを同時に回避する鍵
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1 # Homebrewの自動アップデートを無効化し権限エラーを回避

# 2. Flutterコマンドが利用可能かチェックし、未検出ならインストール
if ! command -v flutter >/dev/null 2>&1; then
    echo "INFO: Flutter not found. Installing via Homebrew..."
    # 'cask'ではなく、'formula'としてインストールを試みる (Caskroomの権限問題を避けるため)
    brew install flutter 
fi

# 3. ルートディレクトリへ移動
cd ../.. 

# 4. Flutterの依存関係を解決 (Generated.xcconfigを生成)
echo "Running flutter pub get..."

# Flutterが使えるようになったか再チェック
if command -v flutter >/dev/null 2>&1; then
    flutter pub get
else
    # ここに到達した場合、インストールに失敗しています
    echo "FATAL ERROR: Flutter command still not found after installation and PATH setting."
    exit 1
fi

# 5. iosディレクトリへ移動 (Podfileがある場所)
cd ios 

echo "Current working directory is: $(pwd)"
echo "Executing pod install..."

# 6. pod install を実行
/usr/local/bin/pod install --repo-update --clean-install

echo "--- END: Pod install success ---"
exit 0