#!/bin/sh

# Xcode Cloudのワークスペースディレクトリに移動
cd $CI_WORKSPACE 

# iOSディレクトリに移動し、pod install を実行して依存関係を解決
# 環境によって、このディレクトリパスは変わる可能性があります。
if [ -d "ios" ]; then
  cd ios
fi

echo "Running pod install..."
pod install

# 成功したか確認
if [ $? -ne 0 ]; then
    echo "pod install failed."
    exit 1
fi