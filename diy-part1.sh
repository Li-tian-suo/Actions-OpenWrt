#!/bin/bash
#
# 在更新 feeds 之前执行的脚本
# 用于添加第三方软件包源
#

# 添加 iStore 软件源（应用商店）
echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default

# 添加 helloworld 源（包含 PassWall 等代理插件）
echo 'src-git helloworld https://github.com/fw876/helloworld.git' >> feeds.conf.default

# 添加 OpenClash 源
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# 添加 kenzo 源（包含多个常用插件）
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages.git' >> feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small.git' >> feeds.conf.default

exit 0
