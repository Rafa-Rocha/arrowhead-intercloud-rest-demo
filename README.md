# Arrowhead Framework Demo for REST-based Intercloud Communication

This repository serves as a demo for trying out the Arrowhead intercloud communication, using only HTTP/REST.

You should use two PCs, one for each cloud.
Import the corresponding SQL schema on each PC/Cloud.
Then, on the DB table "arrowhead_cloud":
 * Change the address "_192.168.60.22_" with your Cloud A address.
 * Change the address "_192.168.60.62_" with your Cloud B address.

The Service Provider is set up to connect to Cloud B, but you can change this in the _default.conf_ file located in the Provider's project folder.
