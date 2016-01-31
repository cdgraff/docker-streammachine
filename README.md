# docker-streammachine
Docker implementation of StreamMachine MediaServer

How to use:
-----------
<pre>
git clone https://github.com/cdgraff/docker-streammachine
cd docker-streammachine
docker-compose up
</pre>

* Master API: http://host-ip:8020/api/config
* Master Publish port: 8005 (icecast protocol)
* Slave Listen: 
  *  http://host-ip/test (icecast/raw)
  *  http://host-ip/test.m3u8 (HLS)
