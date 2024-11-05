#!/usr/bin/env python

from scapy.all import sniff


def packet_callback(packet):
    if packet.haslayer('VXLAN'):
        packet.show()


sniff(iface='eth0', prn=packet_callback)
