#!/bin/sh
set -e

git clean -xdf

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
export JAVA_TOOL_OPTIONS="-Xmx4G -XX:+AlwaysPreTouch -XX:CICompilerCount=$(nproc) -XX:ReservedCodeCacheSize=2G -XX:+DisableAttachMechanism -XX:-DontCompileHugeMethods -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UseFPUForSpilling -XX:+UseStringDeduplication -XX:+UseTransparentHugePages -XX:+UseXMMForArrayCopy"
exec ./gradlew --no-daemon build
