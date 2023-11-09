# Custom Blockstream Jade Blind Oracle

## Structure
This docker compose app is composed by the following containers:
- pinserver 
- pinserver web interface 
- tor
- tailscale vpn and configuartion page

## Install
After docker installation (if needed) download this repository and use the `pinserver.sh` script.

### Tailscale configuration (optional)
With the app running connect on webpage (http://127.0.0.1:8240) and log-in using tailscale credentials.

Enable Magic DNS to allow use pinserver via tailscale.

## Usage 
Use the `pinserver.sh` script for start and stop the pinserver.

Start the app with the command `./pinserver.sh start`

```
./pinserver.sh start

8""""8                                                                 8""""8                        8"""88                              
8    8   e     eeeee eeee e   e  eeeee eeeee eeeee  eeee eeeee eeeeeee 8    8   e     e  eeeee eeeee 8    8 eeeee  eeeee eeee e     eeee 
8eeee8ee 8     8  88 8  8 8   8  8   "   8   8   8  8    8   8 8  8  8 8eeee8ee 8     8  8   8 8   8 8    8 8   8  8   8 8  8 8     8    
88     8 8e    8   8 8e   8eee8e 8eeee   8e  8eee8e 8eee 8eee8 8e 8  8 88     8 8e    8e 8e  8 8e  8 8    8 8eee8e 8eee8 8e   8e    8eee 
88     8 88    8   8 88   88   8    88   88  88   8 88   88  8 88 8  8 88     8 88    88 88  8 88  8 8    8 88   8 88  8 88   88    88   
88eeeee8 88eee 8eee8 88e8 88   8 8ee88   88  88   8 88ee 88  8 88 8  8 88eeeee8 88eee 88 88  8 88ee8 8eeee8 88   8 88  8 88e8 88eee 88ee 

 Usage: ./pinserver.sh [start|stop|log|restart]

 Report bugs to: valerio.vaccaro@gmail.com

[sudo] password for valerio: 
[+] Running 2/2
 ✔ Network custom_blind_oracle_default  Created                                                                                                                                                       0.1s 
 ✔ Container custom_blind_oracle-web-1  Started                                                                                                                                                       0.1s 
[+] Running 4/4
 ✔ Container custom_blind_oracle-tor-1        Started                                                                                                                                                 0.1s 
 ✔ Container custom_blind_oracle-tailscale-1  Started                                                                                                                                                 0.1s 
 ✔ Container custom_blind_oracle-web-1        Running                                                                                                                                                 0.0s 
 ✔ Container custom_blind_oracle-node-1       Started  
```

Visit the page http://127.0.0.1:8095 and set custom blind oracle on Jade using the provided qrcode.

When you what stop the app you can use the command `./pinserver.sh stop`.

```
./pinserver.sh stop

8""""8                                                                 8""""8                        8"""88                              
8    8   e     eeeee eeee e   e  eeeee eeeee eeeee  eeee eeeee eeeeeee 8    8   e     e  eeeee eeeee 8    8 eeeee  eeeee eeee e     eeee 
8eeee8ee 8     8  88 8  8 8   8  8   "   8   8   8  8    8   8 8  8  8 8eeee8ee 8     8  8   8 8   8 8    8 8   8  8   8 8  8 8     8    
88     8 8e    8   8 8e   8eee8e 8eeee   8e  8eee8e 8eee 8eee8 8e 8  8 88     8 8e    8e 8e  8 8e  8 8    8 8eee8e 8eee8 8e   8e    8eee 
88     8 88    8   8 88   88   8    88   88  88   8 88   88  8 88 8  8 88     8 88    88 88  8 88  8 8    8 88   8 88  8 88   88    88   
88eeeee8 88eee 8eee8 88e8 88   8 8ee88   88  88   8 88ee 88  8 88 8  8 88eeeee8 88eee 88 88  8 88ee8 8eeee8 88   8 88  8 88e8 88eee 88ee 

 Usage: ./pinserver.sh [start|stop|log|restart]

 Report bugs to: valerio.vaccaro@gmail.com

[+] Running 5/5
 ✔ Container custom_blind_oracle-node-1       Removed                                                                                                                                                 2.8s 
 ✔ Container custom_blind_oracle-web-1        Removed                                                                                                                                                10.4s 
 ✔ Container custom_blind_oracle-tor-1        Removed                                                                                                                                                 0.3s 
 ✔ Container custom_blind_oracle-tailscale-1  Removed                                                                                                                                                 0.1s 
 ✔ Network custom_blind_oracle_default        Removed 
```

If you need to read logs you can use the command `./pinserver.sh log`
