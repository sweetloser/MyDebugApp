#!/bin/sh

#echo `pwd`

#存放目录
MyDebugAppPath="/opt/MyDebugApp"
echo "模板存放目录：$MyDebugAppPath"

#用户目录
userName="${SUDO_USER-$USER}"
UserPath=`eval echo ~$userName`
echo "用户目录：$UserPath"

#xcode 自定义模板路径
XcodeTemplatePath="$UserPath/Library/Developer/Xcode/Templates"

#echo "$XcodeTemplatePath"


#将文件拷贝进/opt/MyDebugApp
echo "删除目录（如果目录存在）"
rm -rf "$MyDebugAppPath" || true


echo "创建目录并copy模板"
mkdir -p "$MyDebugAppPath" || true
cp -rf ../ "$MyDebugAppPath"

#为模板建立链接
echo "为模板建立链接"
ln -fs "$MyDebugAppPath/XcodeTemplate" "$XcodeTemplatePath/MyDebugApp"




