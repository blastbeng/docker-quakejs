**docker-quakejs - A containerized version of quakejs**



Thanks to @treyyoder for his awesome work (https://github.com/treyyoder/quakejs-docker)



To use this image:

    copy server.cfg.example to server.cfg and customize it
    
    launch ./build.sh
    
    launch docker-compose up -d on root dir 
    
    go to yourip:yourport and start fraggin' :)

Optionally you can change the http port in the docker-compose.yml.

The default IP:PORT is 127.0.0.1:8080. The IP can be changed in the server.cfg before building the image.
