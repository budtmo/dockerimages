Docker NFS Server
=================

Requirements
------------
1. Docker
2. Docker-Compose (Optional)

Quick Start
-----------

- Create a docker volume for docker nfs: ```mkdir -p ~/sharedvolume && docker volume create --name shared --opt type=none --opt device=~/sharedvolume --opt o=bind```

- Run docker-nfs: ```docker run -d -v shared:/sharedvolume -p 2049:2049 budtmo/nfs```

- Install nfs-client on the client side: ```sudo apt-get install nfs-client -y```

- Connect client with nfs-server: ```sudo mount xx.xx.xx.xx:/ <target_path_on_client_machine>```

- Check if it is connected: ```df -h```

Use cases
---------

- In case you want to use custom exports file: ```docker run -d -v shared:/sharedvolume -v <path-of-exports>:/etc/exports -p 2049:2049 budtmo/nfs```

- If you want to connect k8s pod to nfs server, you need to install nfs client on the k8s node first to make it work
