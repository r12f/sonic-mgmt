docker run -it --rm --name=sonic_gnmi_agent --network host sonic-gnmi-agent:latest
gnmi_client.py -t 10.250.0.55:8080 update -f /sonic/templates/vnet2vnet.j2
