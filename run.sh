#!/usr/bin/env bash

if ! gem list docker-sync -i; then gem install docker-sync; fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "
  rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 3000
  " | sudo pfctl -ef -
fi

if [ "$(cat /etc/hosts | grep snpt.io | wc -l)" -eq 0 ]; then
  sudo -- sh -c -e "echo '127.0.0.1    snpt.io' >> /etc/hosts";
else
  echo "snpt.io found"
fi

docker-compose kill
docker-compose build $1
docker-sync stop
docker-sync start
docker-compose up
