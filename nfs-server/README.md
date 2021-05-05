Docker NFS Server
=================

Requirements
------------
1. Docker
2. Docker-Compose (Optional)

Quick Start
-----------

- Run docker-nfs: ```docker run -d -p 2049:2049 budtmo/nfs```

- Install nfs-client on the client side: ```sudo apt-get install nfs-client -y```

- Connect client with nfs-server: ```sudo mount xx.xx.xx.xx:/ <target_path_on_client_machine>```

- Check if it is connected: ```df -h```
