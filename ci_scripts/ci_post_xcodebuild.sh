#!/bin/sh

echo "--- START: Running CocoaPods installation via ci_scripts/ci_post_clone.sh ---"
# スクリプトは ci_scripts フォルダで実行されるため、親ディレクトリへ移動してから ios へ移動します
cd .. 

# Podfileがあるディレクトリ（通常はios）に移動
cd ios 

# pod のフルパスを指定して実行
echo "Executing /usr/local/bin/pod install --repo-update --clean-install..."
/usr/local/bin/pod install --repo-update --clean-install

# pod install が失敗したらビルドを中断
if [ $? -ne 0 ]; then
    echo "ERROR: pod install FAILED."
    exit 1
fi

echo "--- END: CocoaPods installation completed ---"
exit 0