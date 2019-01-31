# Arrowhead Framework Demo for REST-based Intercloud Communication

This repository serves as a demo for trying out the Arrowhead intercloud communication, using only HTTP/REST.
This demo abides to the following scenario:
1. Two Arrowhead Clouds (Cloud 1 and Cloud 2) are setup on different machines;
2. An Arrowhead Service Provider is registered on Cloud 2;
3. An Arrowhead Service Consumer asks Cloud 1's Orchestrator for the Provider's service on Cloud 1;
4. Cloud 1 checks that it does not have the requested service in its Service Registry and contacts its neighbor clouds to check if they have it, through the Gatekeeper system;
5. Cloud 1 realizes that Cloud 2 has the desired service and requests Cloud 2 for the Service Provider's address.
6. Cloud 2 sends the Service Provider's address to Cloud 1, and Cloud 1 sends it back to the Service Consumer.
7. Finally, the Service Consumer then requests the Service Provider for its service.

If this is your first time setting up an Arrowhead cloud, you should first check out Arrowhead's repository (https://github.com/arrowhead-f/core-java) for the tutorial on building and running the Arrowhead services.

For this demo, you should use two PCs, one for each cloud. Next, build and run the two clouds on each PC and import the corresponding SQL schema (located in _database-schemas_) for each cloud's database.

Then, for both clouds' database, on the table "arrowhead_cloud":
 * Change the address "_192.168.60.22_" with your Cloud 1 address.
 * Change the address "_192.168.60.62_" with your Cloud 2 address.

Next, edit the corresponding _default.conf_ file of the Consumer and Provider and change the IP of each Arrowhead service to the correct one. Lastly, run the Provider first and the Consumer second.
