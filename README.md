**docker-quakejs - A containerized version of quakejs**



Thanks to @treyyoder for his awesome work (https://github.com/treyyoder/quakejs-docker)



To use this image:

    copy server.cfg.example to server.cfg and customize it
    
    launch ./build.sh
    
    launch docker-compose up -d on root dir 
    
    go to yourip:yourport and start fraggin' :)

Optionally you can change the http port in the docker-compose.yml, the default is 8080.
There's not default IP, this image supports both localhost, lan ip or public ip.

If you want to join my server: http://fabiovalentino.it:8081
