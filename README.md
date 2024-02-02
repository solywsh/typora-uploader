# typroa-uploader

> typroa的图片上传脚本，针对[Telegraph-Image](https://github.com/cf-pages/Telegraph-Image)项目，适用于macOS和Linux系统。

⚠️：本脚本由AI生成不保证可用性

## 如何安装

clone该项目

```shell
git clone https://github.com/solywsh/typora-uploader
```

或是下载保存`upload-image.sh`文件即可。

## 运行前准备

### 安装json处理器

macOS

```shell
brew install jq
```

Linux：

```shell
# Debian/Ubuntu
apt install jq -y
```

### 脚本配置

编辑脚本，在以下位置填入你的url：

```shell
# 自定义URL部分
base_url=""
```

### Typroa配置

记住脚本的位置，如:

```shell
～/project/scripts/typora-uploader/upload-image.sh
```

进入Typroa`设置`->`图像`->`上传服务设定`，将上传服务改为`自定义命令`，命令为`脚本路径`：

![Screenshot 2024-02-03 at 03.17.42](https://img.panic.ltd/file/a119f8c624123c631bd52.png)

记得在插入图片时选择`上传图片`，并勾选`对本地位置的图片应用上述规则`。

最后验证图片上传选项。

