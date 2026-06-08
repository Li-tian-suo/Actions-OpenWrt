#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认 IP 地址（从 192.168.1.1 改为 192.168.2.1，避免光猫冲突）
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/IPQ8074-5G-CPE/g' package/base-files/files/bin/config_generate

# 添加 5G 模块支持的内核选项（确保编译进去）
echo 'CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y' >> .config
echo 'CONFIG_PACKAGE_kmod-usb-serial-option=y' >> .config
echo 'CONFIG_PACKAGE_kmod-mhi-pci-generic=y' >> .config

# 添加 PCIe NVMe 支持
echo 'CONFIG_PACKAGE_kmod-pcie-qcom=y' >> .config
echo 'CONFIG_PACKAGE_kmod-nvme=y' >> .config

# 添加文件共享支持
echo 'CONFIG_PACKAGE_samba4-server=y' >> .config
echo 'CONFIG_PACKAGE_kmod-fs-ext4=y' >> .config
echo 'CONFIG_PACKAGE_kmod-fs-exfat=y' >> .config
echo 'CONFIG_PACKAGE_kmod-fs-ntfs=y' >> .config

# 启用一些常用工具
echo 'CONFIG_PACKAGE_htop=y' >> .config
echo 'CONFIG_PACKAGE_tcpdump=y' >> .config

# 显示编译时的详细信息（方便排查问题）
echo 'CONFIG_DEVEL=y' >> .config
echo 'CONFIG_KERNEL_DEBUG_INFO=y' >> .config
