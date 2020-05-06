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

- Run limesurvey with MySQL database: ```docker-compose -f docker-compose-mysql.yml up -d```
