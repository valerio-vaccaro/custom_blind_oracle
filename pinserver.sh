#!/bin/bash

echo "
8\"\"\"\"8                                                                 8\"\"\"\"8                        8\"\"\"88                              
8    8   e     eeeee eeee e   e  eeeee eeeee eeeee  eeee eeeee eeeeeee 8    8   e     e  eeeee eeeee 8    8 eeeee  eeeee eeee e     eeee 
8eeee8ee 8     8  88 8  8 8   8  8   \"   8   8   8  8    8   8 8  8  8 8eeee8ee 8     8  8   8 8   8 8    8 8   8  8   8 8  8 8     8    
88     8 8e    8   8 8e   8eee8e 8eeee   8e  8eee8e 8eee 8eee8 8e 8  8 88     8 8e    8e 8e  8 8e  8 8    8 8eee8e 8eee8 8e   8e    8eee 
88     8 88    8   8 88   88   8    88   88  88   8 88   88  8 88 8  8 88     8 88    88 88  8 88  8 8    8 88   8 88  8 88   88    88   
88eeeee8 88eee 8eee8 88e8 88   8 8ee88   88  88   8 88ee 88  8 88 8  8 88eeeee8 88eee 88 88  8 88ee8 8eeee8 88   8 88  8 88e8 88eee 88ee 

 Usage: ./pinserver.sh [start|stop|log|restart]

 Report bugs to: valerio.vaccaro@gmail.com
"

export APP_PINSERVER_PORT="8096"
export APP_PINSERVER_WEB_PORT="8081"
tor_hidden_service_dir="/data/tor/hidden_service"

cat > ./data/torrc <<EOF

# pinserver Hidden Service
HiddenServiceDir $tor_hidden_service_dir
HiddenServicePort $APP_PINSERVER_PORT custom_blind_oracle-node-1:$APP_PINSERVER_PORT
HiddenServicePort 80 custom_blind_oracle-web-1:$APP_PINSERVER_WEB_PORT

EOF

app_pinserver_hidden_service_file="${tor_hidden_service_dir}/hostname"
export APP_PINSERVER_HIDDEN_SERVICE="$(sudo cat ."${app_pinserver_hidden_service_file}" 2>/dev/null || echo "notyetset.onion")"
export APP_TAILSCALE_URL="$(hostname 2>/dev/null || echo "notyetset.tailscale")"

case "$1" in
  "start")
    docker compose up --detach web
    sleep 1

    docker compose up -d
    ;;
  "stop")
    docker compose down
    ;;
  "log")
    docker compose logs
    ;;
  "restart")
    docker compose restart
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac

