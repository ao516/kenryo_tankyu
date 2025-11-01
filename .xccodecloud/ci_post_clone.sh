#!/bin/sh

# 現在のディレクトリとユーザーの表示（デバッグ用）
echo "--- ci_post_clone.sh started ---"
echo "Current directory: $(pwd)"
echo "User: $(whoami)"

# Xcode Cloudのワークスペースディレクトリに移動
cd $CI_WORKSPACE 

# Podfileが存在するディレクトリ（通常はios）へ移動
# 確実に移動できるように、パスを明示的に記述
if [ -d "ios" ]; then
  echo "Changing directory to ios"
  cd ios
else
  echo "Error: 'ios' directory not found at $CI_WORKSPACE"
  exit 1
fi

echo "Running pod install in $(pwd)..."
# CocoaPodsの依存関係をインストール
# --repo-updateオプションでリポジトリを更新することで、エラー回避率が上がる場合があります。
/usr/local/bin/pod install --repo-update

# pod install が失敗したらビルドも失敗として終了
if [ $? -ne 0 ]; then
    echo "ERROR: pod install failed."
    exit 1
fi

echo "pod install completed successfully."
echo "--- ci_post_clone.sh finished ---"
exit 0