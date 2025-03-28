ARG CONTAINER=ghcr.io/openwrt/sdk
ARG ARCH=mips_24kc
FROM $CONTAINER:$ARCH

LABEL "com.github.actions.name"="OpenWrt SDK"

# 切换到 root 用户
USER root

# 安装 time
RUN apt-get update && apt-get install -y time && rm -rf /var/lib/apt/lists/*

USER buildbot

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
