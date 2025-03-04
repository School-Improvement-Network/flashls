#!/bin/bash
if [ -z "$FLEXPATH" ]; then
  echo "Usage FLEXPATH=/path/to/flex/sdk sh ./build.sh"
  exit
fi

if [ -z "$PLAYER_VERSION" ]; then
  PLAYER_VERSION="15.0"
fi

OPT_DEBUG="-use-network=false \
    -optimize=true \
    -define=CONFIG::LOGGING,true \
    -define=CONFIG::FLASH_11_1,true"

OPT_RELEASE="-use-network=false \
    -optimize=true \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::FLASH_11_1,true"

OPT_DEBUG_10_1="-use-network=false \
    -optimize=true \
    -define=CONFIG::LOGGING,true \
    -define=CONFIG::FLASH_11_1,false"

OPT_RELEASE_10_1="-use-network=false \
    -optimize=true \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::FLASH_11_1,false"

echo "Compiling bin/debug/flashls.swc"
$FLEXPATH/bin/compc \
    $OPT_DEBUG_10_1 \
    -strict="false" \
    -include-sources ../src/org/mangui/hls \
    -output ../bin/debug/flashls.swc \
    -target-player=$PLAYER_VERSION

echo "Compiling bin/release/flashls.swc"
$FLEXPATH/bin/compc \
    $OPT_RELEASE_10_1 \
    -strict="false" \
    -include-sources ../src/org/mangui/hls \
    -output ../bin/release/flashls.swc \
    -target-player=$PLAYER_VERSION

# echo "Compiling bin/release/flashlsChromeless.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/chromeless/ChromelessPlayer.as \
#     -source-path ../src \
#     -o ../bin/release/flashlsChromeless.swf \
#     $OPT_RELEASE \
#     -library-path+=../lib/blooddy_crypto.swc \
#     -target-player="11.1" \
#     -default-size 480 270 \
#     -default-background-color=0x000000
# ./add-opt-in.py ../bin/release/flashlsChromeless.swf

# echo "Compiling bin/debug/flashlsChromeless.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/chromeless/ChromelessPlayer.as \
#     -source-path ../src \
#     -o ../bin/debug/flashlsChromeless.swf \
#     $OPT_DEBUG \
#     -library-path+=../lib/blooddy_crypto.swc \
#     -target-player="11.1" \
#     -default-size 480 270 \
#     -default-background-color=0x000000
# ./add-opt-in.py ../bin/debug/flashlsChromeless.swf

#echo "Compiling flashlsBasic.swf"
#$FLEXPATH/bin/mxmlc ../src/org/mangui/basic/Player.as \
#   -source-path ../src \
#   -o ../test/chromeless/flashlsBasic.swf \
#   $COMMON_OPT \
#   -target-player="11.1" \
#   -default-size 640 480 \
#   -default-background-color=0x000000

# echo "Compiling bin/release/flashlsFlowPlayer.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/flowplayer/HLSPluginFactory.as \
#     -source-path ../src -o ../bin/release/flashlsFlowPlayer.swf \
#     $OPT_RELEASE \
#     -library-path+=../lib/flowplayer \
#     -load-externs=../lib/flowplayer/flowplayer-classes.xml \
#     -target-player="11.1"
# ./add-opt-in.py ../bin/release/flashlsFlowPlayer.swf

# echo "Compiling bin/debug/flashlsFlowPlayer.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/flowplayer/HLSPluginFactory.as \
#     -source-path ../src -o ../bin/debug/flashlsFlowPlayer.swf \
#     $OPT_DEBUG \
#     -library-path+=../lib/flowplayer \
#     -load-externs=../lib/flowplayer/flowplayer-classes.xml \
#     -target-player="11.1"
# ./add-opt-in.py ../bin/debug/flashlsFlowPlayer.swf

# echo "Compiling bin/release/flashlsOSMF.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/osmf/plugins/HLSDynamicPlugin.as \
#     -source-path ../src \
#     -o ../bin/release/flashlsOSMF.swf \
#     $OPT_RELEASE_10_1 \
#     -library-path+=../lib/osmf \
#     -load-externs ../lib/osmf/exclude-sources.xml \
#     -target-player="10.1" #-compiler.verbose-stacktraces=true -link-report=../test/osmf/link-report.xml
# ./add-opt-in.py ../bin/release/flashlsOSMF.swf

# echo "Compiling bin/debug/flashlsOSMF.swf"
# $FLEXPATH/bin/mxmlc ../src/org/mangui/osmf/plugins/HLSDynamicPlugin.as \
#     -source-path ../src \
#     -o ../bin/debug/flashlsOSMF.swf \
#     $OPT_DEBUG_10_1 \
#     -library-path+=../lib/osmf \
#     -load-externs ../lib/osmf/exclude-sources.xml \
#     -target-player="10.1" #-compiler.verbose-stacktraces=true -link-report=../test/osmf/link-report.xml
# ./add-opt-in.py ../bin/debug/flashlsOSMF.swf

# echo "Compiling bin/release/flashlsOSMF.swc"
# $FLEXPATH/bin/compc -include-sources ../src/org/mangui/osmf \
#     -output ../bin/release/flashlsOSMF.swc \
#     $OPT_RELEASE_10_1 \
#     -library-path+=../bin/release/flashls.swc \
#     -library-path+=../lib/osmf \
#     -target-player="10.1" \
#     -debug=false \
#     -external-library-path+=../lib/osmf

# echo "Compiling bin/debug/flashlsOSMF.swc"
# $FLEXPATH/bin/compc -include-sources ../src/org/mangui/osmf \
#     -output ../bin/debug/flashlsOSMF.swc \
#     $OPT_DEBUG_10_1 \
#     -library-path+=../bin/debug/flashls.swc \
#     -library-path+=../lib/osmf \
#     -target-player="10.1" \
#     -debug=false \
#     -external-library-path+=../lib/osmf