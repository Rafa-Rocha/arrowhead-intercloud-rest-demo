# Arrowhead Framework Demo for REST-based Intercloud Communication

This repository serves as a demo for trying out the Arrowhead intercloud communication, using only HTTP/REST.

Before going into the intercloud configuration, if this is your first time setting up an Arrowhead cloud, check out Arrowhead's repository (https://github.com/arrowhead-f/core-java) for the tutorial on building and running the Arrowhead services.

For this demo, you should use two PCs, one for each cloud. Next, build and run the two clouds on each PC and import the corresponding SQL schema (located in _database-schemas_) for each cloud's database.

Then, for both clouds' database, on the table "arrowhead_cloud":
 * Change the address "_192.168.60.22_" with your Cloud 1 address.
 * Change the address "_192.168.60.62_" with your Cloud 2 address.

The Service Provider is set up to connect to Cloud 2, but you can change this in the _default.conf_ file located in the Provider's project folder.
