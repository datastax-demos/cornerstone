#!/usr/bin/env bash
set -x # echo on

cd /cornerstone/web/datastax/investment-manager/StockData
mvn package
mvn install:install-file -DgroupId=StockData -DartifactId=StockData \
    -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar \
    -Dfile=/cornerstone/web/datastax/investment-manager/StockData/target/StockData-0.0.1-SNAPSHOT.jar

cd /cornerstone/web/datastax/investment-manager/Portfolio
mvn package
