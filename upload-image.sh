#!/bin/bash

# 自定义URL部分
base_url=""

# 检查是否安装了jq
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq before running this script. "
    echo "You can install jq using the following command:"
    echo "brew install jq [macOS]"
    exit 1
fi

# 用于存储图片URL的数组
image_urls=()

# 循环读取参数
for file_path in "$@"; do
    # 发送上传图片请求，关闭curl输出
    response=$(curl --location --request POST "${base_url}/upload" \
        --header 'User-Agent: Apifox/1.0.0 (https://apifox.com)' \
        --form "file=@\"${file_path}\"" \
        --silent)  # 添加 --silent 选项以关闭输出

    # 检查请求是否成功
    if [ $? -eq 0 ]; then
        # 解析返回的JSON并拼接图片URL
        img_url="${base_url}$(echo "$response" | jq -r '.[0].src')"

        # 存储图片URL到数组
        image_urls+=("${img_url}")
    else
        # 请求失败，输出错误信息并退出脚本
        echo "Upload Failed"
        exit 1
    fi
done

# 所有请求成功后输出成功信息
echo "Upload Success"

# 输出所有图片URL
for url in "${image_urls[@]}"; do
    echo "${url}"
done