# Darkly-Scanner    ![](https://img.shields.io/github/stars/TheOneOh1/Darkly-Scanner)

- Simple Tool to TCP scan a specific port for multiple Domains/IP Addresses at once.
- Script accepts a file as input with Domains and also checks if the domain is valid or not
- Most useful in cases where you are enumerating multiple subdomains at once.

-------------------------------------------------------------------------------------------

### Prerequesites

- Make sure to install Host and nmap using..

```
apt install host                  --> To check if Domain is valid or not
apt install nmap                  --> For Port Scanning
```
-------------------------------------------------------------------------------------------

### How to use?

- Clone or download the script
- The Script uses a file as a command line argument.
- The file contains the Domain/IP Address list for which you want the Port status

```
bash <script.sh> -f <filename>


-f : Input File
-h : Help Page
```

-------------------------------------------------------------------------------------------

### Output

![](https://github.com/TheOneOh1/Darkly-Scanner/blob/master/PortScan.png)
