LOCAL_DIR=$(cd `dirname $0`; pwd)
TMP_DIR=$LOCAL_DIR/tmp
mkdir $TMP_DIR
PROJECT_DIR=$LOCAL_DIR/../..
mv $PROJECT_DIR/assets/android/* $TMP_DIR/
source $LOCAL_DIR/../properties.sh
app_path="build/macos/Build/Products/Release"
flutter build macos
rm -rf "$app_path/移动到这"
ln -s -f /Applications "$app_path/移动到这"
mkdir -p "$app_path/ADB TOOL.app/Contents/MacOS/data/usr/bin"
$PROJECT_DIR/scripts/patch_executable.sh
tar -zcvf ./$APP_NAME.tar  -C ./build/macos/Build/Products/  "Release/ADB TOOL.app/" Release/移动到这
rm -rf "$app_path/移动到这"

mv $TMP_DIR/* $PROJECT_DIR/assets/android/
rm -r $TMP_DIR