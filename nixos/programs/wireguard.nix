{
    networking.wireguard.enable = true;
    networking.wireguard.interfaces = {
        wg0 = {
            ips = ["10.10.10.100/24"];
            peers = [
                {
                    allowedIPs = ["0.0.0.0/0"];
                    endpoint = "192.168.0.103:51820";
                    publicKey = "kILSAbwrKbZkG24X/ZLQyMP3DoiG5VzEMEd1omDeoh4=";
                    persistentKeepalive = 25;
                }
            ];
            privateKey = "kLrZytFgIbex6zYCT363qPh/G+0IqkAGFmvt2rybGXU=";
        }; 
    };
}
