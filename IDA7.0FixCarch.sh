#!/bin/bash

app_name="ida"
shell_path="$(dirname "$0")"
framework_name="libqcocoa"
app_bundle_path="/Applications/IDA Pro 7.0/${app_name}.app/Contents/PlugIns/platforms"
app_executable_path="${app_bundle_path}/libqcocoa.dylib"
app_executable_backup_path="${app_executable_path}_backup"

# 备份原始可执行文件
if [ ! -f "$app_executable_backup_path" ]
then
cp "$app_executable_path" "$app_executable_backup_path"
result="y"
else
read -t 150 -p "已安装补丁包，是否覆盖？[y/n]:" result
fi

if [[ "$result" == 'y' ]]; then
    cp -r "${shell_path}/libqcocoa.dylib" "$app_bundle_path"
    echo -e "\n\修复完成" 
fi


