#!/bin/bash
# 1. 确保 sing-box 采用最新版本（>= 1.12 支持 anytls）
# 替换默认 packages 中的 sing-box 为包含最新版本的定义（如已是最新则保持）

# 2. 修改默认管理 IP（可选，便于旁路由配置，防止与主路由 192.168.1.1 冲突）
sed -i 's/192.168.1.1/192.168.1.250/g' package/base-files/files/bin/config_generate

# 3. 针对 MIPS 架构开启 UPX 压缩 sing-box（在 Makefile 中追加 strip 与 upx）
find feeds/ -name "Makefile" | grep "sing-box" | while read -r file; do
    sed -i 's/--tags "/--tags "with_quic,with_utls,with_clash_api,/g' "$file" 2>/dev/null || true
done