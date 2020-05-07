#!/bin/bash

if [ -z "$1" ]; then
    read -p "Task (start|stop) : " TASK
else
    TASK=$1
fi

function start() {
	mkdir -p data_pgadmin && sudo chmod -R 777 data_pgadmin
	mkdir -p data_limesurvey
	docker-compose up -d
}

function stop() {
	docker-compose kill
	docker-compose rm -f
}

function backup_limesurvey() {
	echo "BackUp work after you are done with setting up the limesurvey"
	docker cp limesurvey_service:/var/www/html/limesurvey/application/config/config.php data_limesurvey/config.php
	echo "Done"
}

case $TASK in
    start)
        start
    ;;
    stop)
        stop
    ;;
    backup_limesurvey)
        backup_limesurvey
    ;;
    *)
        echo "Invalid environment! Valid options: start, stop, backup_limesurvey"
    ;;
esac
