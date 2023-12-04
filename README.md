# brecon
brecon is a bash script that chains together assetfinder, amass, gobuster, httpx, and Censys for both active and passive reconnaissance.
It categorizes files based on their response status code, making it easier to handle with other tools. Additionally, it captures screenshots using gowitness, excluding status code 404, and then launches the gowitness server to review each response. It's an automated and fast reconnaissance script.


### Requirements
Install httpx

    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    
Install amass

    go install -v github.com/OWASP/Amass/v3/...@master

Install assetfinder

    https://github.com/tomnomnom/assetfinder

Install censys-subdomain-finder

    https://github.com/christophetd/censys-subdomain-finder

Install gobuster

    go install github.com/OJ/gobuster/v3@latest

In the same brecon directory, clone the wordlist for gobuster:

    For example: wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt 

Install gowitness

    go install github.com/sensepost/gowitness@latest



### It's easy!

Clone the repo, give it execute permissions and run the script!

    git clone https://github.com/bronxi47/brecon.git
    
    chmod +x brecon.sh
    
    
Usage:

    ./brecon [URL] [DIRECTORY-NAME]

For example:

    ./brecon example.com example_web

