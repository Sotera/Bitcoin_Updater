#!/usr/bin/env bash

rm -f Bitcoin_Updater.jar
rm -rf target/
mkdir target
find src -name "*.java" | xargs javac -d target -cp .:jsch-0.1.46.jar:mysql-connector-java-5.1.18-bin.jar
jar cvfm Bitcoin_Updater.jar manifest.txt -C target/ .
