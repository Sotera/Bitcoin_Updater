# Bitcoin Updater
This application can download the entire bitcoin blockchain, and keep it updated, using blockexplorer.com API.  It can also download all the market data from the API of bitcoincharts.com and keep it up to date as well.  It will store the information into a (somewhat) optimized MYSQL database.

## Usage
[jdbc], [user], [pass], [schema_filepath (optional)] params...<br/>
-i: iterates through the entire blockchain. adding missing links along the way<br/>
-c: only adds the most recent blocks, stopping once the first existing link is found<br/>
-h: fetches historical market data, stopping once the first existing link is found<br/>
-b: builds the database schema. Must pass schema filepath to work.<br/>

## Compile

```
$ ./build.sh
```

## Examples
First time usage:<br/>
- Create an empty MYSQL database, and change the jdbc path as necessary.
```
java -jar Bitcoin_Updater.jar jdbc:mysql://localhost:3306/Bitcoin username password schema.txt -b
``

Usage examples:<br/>
To recursively build the blockchain from scratch.  If the block already exists in the database, it will skip it and continue.  You can think of this option as a kind of consistency checker.<br/>
```
java -jar Bitcoin_Updater.jar jdbc:mysql://localhost:3306/Bitcoin username password -i
``

To recursively update the blockchain.  If the block already exists in the database, the program will terminate
```
java -jar Bitcoin_Updater.jar jdbc:mysql://localhost:3306/Bitcoin username password -c
```

To update/build the historical market data.  If the historical market data already exists, the program will terminate and go to the next market.
```
java -jar Bitcoin_Updater.jar jdbc:mysql://localhost:3306/Bitcoin username password -h
```

##Schema
<img src="https://github.com/Sotera/Bitcoin_Updater/raw/master/schema/schema.png"/>
