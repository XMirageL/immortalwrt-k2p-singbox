#!/bin/bash
# 移除可能存在的旧源并接入 Openwrt-Passwall 最新源
sed -i '/passwall/d' feeds.conf.default
echo "src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/Openwrt-Passwall/openwrt-passwall.git;main" >> "feeds.conf.default"