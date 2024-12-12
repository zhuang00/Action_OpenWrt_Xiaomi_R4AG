#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 取消插件注释
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加插件源码
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

# 添加插件源码
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# passwall依赖
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default


## 2.修改mt7621.mk
export imsize1=$(grep  -a -n -e 'define Device/xiaomi_mi-router-4a-gigabit' target/linux/ramips/image/mt7621.mk|cut -d ":" -f 1)
export imsize1=$(expr $imsize1 + 3)
export imsize1=$(echo $imsize1"s")
sed -i "$imsize1/IMAGE_SIZE := .*/IMAGE_SIZE := 16064k/" target/linux/ramips/image/mt7621.mk
