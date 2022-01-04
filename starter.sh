sed 's/"host": "localhost"/"host": "'$DATABASE_HOST'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"user": "adamant"/"user": "'$DATABASE_USER'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"password": "password"/"password": "'$DATABASE_PASSWORD'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"adamant_main"/"'$DATABASE_NAME'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"consoleLogLevel": "none"/"consoleLogLevel": "'$LOG_LEVEL'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"ip": "51.15.221.205"/"ip": "'$IP1'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"ip": "51.15.88.53"/"ip": "'$IP2'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"ip": "51.15.217.230"/"ip": "'$IP3'"/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"public": false/"public": true/g' config.json > tmpfile; mv tmpfile config.json
sed 's/"force": false/"force": true/g' config.json > tmpfile; mv tmpfile config.json
if [ $NODE_ID = '1' ];then
sed 's/"secret": \[\]/"secret": \["planet mesh file worth borrow jeans urban boost hero dignity prosper scissors"\]/g' config.json > tmpfile; mv tmpfile config.json
elif [ $NODE_ID = '2' ];then
sed 's/"secret": \[\]/"secret": \["indoor wonder receive goose service hidden month quiz inside novel fiscal increase"\]/g' config.json > tmpfile; mv tmpfile config.json
elif [ $NODE_ID = '3' ];then
sed 's/"secret": \[\]/"secret": \["fall rain crime game divorce medal skirt solve surge tobacco try tennis"\]/g' config.json > tmpfile; mv tmpfile config.json
fi 
echo "$(<config.json)"
head -n 500 genesisBlock.json
node app.js
