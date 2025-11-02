#!/bin/sh
# Fail this script if any subcommand fails.
set -e

echo "--- START: Final pod install attempt (Using FVM/Homebrew Logic) ---"

# Installed Flutter version
# 使用したいFlutterバージョンを指定 (例: 3.16.3, 最新版は 'stable')
FLUTTER_VERSION="stable" 

# 1. Homebrewの自動アップデートを無効化して権限問題を避ける
export HOMEBREW_NO_AUTO_UPDATE=1

# 2. FVMのインストールと設定
# brew tapは不要な場合があるため、直接fvmをインストール
echo "Installing FVM via Homebrew..."
if ! command -v fvm >/dev/null 2>&1; then
    brew install fvm
fi

# 3. FVMで指定バージョンのFlutterをインストールし、グローバルに設定
echo "Installing Flutter version: ${FLUTTER_VERSION}..."
fvm install "${FLUTTER_VERSION}"
fvm global "${FLUTTER_VERSION}"

# FVMのパスをシェルに認識させる
export PATH="$HOME/.fvm/fvm_shim:$PATH"
echo "INFO: FVM path added to PATH."

# 4. ルートディレクトリへ移動
cd ../.. 

# 5. Flutterの依存関係を解決 (Generated.xcconfigを生成)
echo "Running fvm flutter precache and pub get..."

# iOSアーティファクトの取得（ビルドを確実にする）
fvm flutter precache --ios 
# パッケージの取得 (Generated.xcconfigを生成)
fvm flutter pub get

# 6. iosディレクトリへ移動 (Podfileがある場所)
cd ios 

echo "Current working directory is: $(pwd)"
echo "Executing pod install..."

# 7. CocoaPodsの依存関係を取得
# Homebrewでインストール済みのpodを使う (必要であれば brew install cocoapods を追加)
pod install

# 失敗チェックは set -e で行われるため省略

echo "--- END: Pod install success ---"
exit 0