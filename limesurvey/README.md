Docker LimeSurvey
=================

[LimeSurvey](https://github.com/LimeSurvey/LimeSurvey) inside Docker-Image.

Requirements
------------
1. Docker
2. Docker-Compose (Optional)


Quick Start
-----------

- Run limesurvey: ```docker run -d -p 8081:80 budtmo/limesurvey```

- Run limesurvey with database (MySQL or Postgres): ```docker-compose up -d```
	- PgAdmin: access [http://127.0.0.1:8081](http://127.0.0.1:8081)
	- LimeSurvey App: access [http://127.0.0.1:8082/limesurvey](http://127.0.0.1:8082/limesurvey)
