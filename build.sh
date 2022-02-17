if test -f "server.cfg"; then
	docker build . -t quakejs:custom
else
	echo "please copy server.cfg.example and customize it before run this build."
fi
