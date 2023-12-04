# brecon
brecon is a bash script that chains together assetfinder, amass, gobuster, httpx, and Censys for both active and passive reconnaissance.
It categorizes files based on their response status code, making it easier to handle with other tools. Additionally, it captures screenshots using gowitness, excluding status code 404, and then launches the gowitness server to review each response. It's an automated and fast reconnaissance script.
