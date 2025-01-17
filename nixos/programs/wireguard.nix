{
    networking.wireguard.enable = true;
    networking.wireguard.interfaces = {
        wg0 = {
            ips = ["10.10.10.100/24"];
            peers = [
                {
                    allowedIPs = ["10.10.10.1/24"];
                    endpoint = "192.168.0.3:51820";
                    publickey = "";
                }
            ];
            privatekey = "kLrZytFgIbex6zYCT363qPh/G+0IqkAGFmvt2rybGXU=";
        }; 
    };
}
