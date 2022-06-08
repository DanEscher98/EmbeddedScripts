# Tips to Connect a Cisco Device

- This devices do not usually have a default IP address, so we need to
    set one up before we can connect to it over the network.
- The console connection is useful to do the initial configuration.
- Old console cables (`DB9` to `RJ45`) and newest ones (`USB` to
    `miniUSB`).
- One could connect to a router through `In-Band` connection and by
    `Out-of-Band` connection.
- Configuration Storage Locations:
    - The IOS image is stored in Flash
    - The Startup Configuration is stored in NVRAM
    - The Running Configuration is loaded in RAM from the Startup
        Config when the device boots up
