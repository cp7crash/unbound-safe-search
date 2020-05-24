# Overview
[OpenDNS Family Shield](https://www.opendns.com/setupguide/#familyshield) (or indeed many other filtering DNS providers) cannot enforce [safe search](https://support.opendns.com/hc/en-us/articles/227986807-How-to-Enforcing-Google-SafeSearch-YouTube-and-Bing) for search engines.
Short of introducing an HTTP proxy, a common recommendation is to use host files to work around this issue but with a larger number of devices centralized management is desirable.

This can be achieved by using a local DNS resolver that intercepts requests and redirects them to their safe-search equivalent hosts, with Unbound being a great free tool to achieve this.

# Setup
If you already familiar with Unbound, you'll just need the `safe-search.conf` file which you can include using `include: "safe-search.conf"`(make sure you do this before you declare any forward zones).

To setup from scratch:

1. Download and install [Unbound](https://nlnetlabs.nl/projects/unbound/download)
0. Replace `server.conf` with relevant details
0. Copy `safe-search.conf` into your Unbound directory
0. Restart the unbound service

The provided `server.conf` assumes multiple VLANs/APs (one for adults, one for kids) with the non-restricted/adult DNS server provided on a different IP.

# Generating Config
See `generate-zones.cmd` for a little help if you need to generate config for a long list of domains (used for google domain list)

_All tested on Windows Server 2019 and Unbound 1.10_
