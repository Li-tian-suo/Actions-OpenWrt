#!/bin/bash
#
# 在更新 feeds 之后执行的脚本
# 用于修改配置、添加自定义文件等
#

# 修改默认 IP 地址（避免和光猫冲突）
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/IPQ8074-5G-CPE/g' package/base-files/files/bin/config_generate

# 等待 feeds 安装完成后，修复可能缺失的依赖
# 针对 iStore 的依赖 luci-compat[citation:7]
echo 'CONFIG_PACKAGE_luci-compat=y' >> .config

# 创建自定义文件目录（用于存放 ART 校准文件等）
mkdir -p files/etc/config

exit 0
