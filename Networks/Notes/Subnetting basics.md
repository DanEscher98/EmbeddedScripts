## Subnetting Basics


### Address classes

  - **Class A** => [1.0.0.0, 126.0.0.0]

        Addresses begin with 0xxx
        Are for networks with large number of total hosts. 
        Subnet Mask: 255.0.0.0 (8 bits)
        Number of Networks: 126
        Number of Hosts per Network: 16,777,214

  - **Class B** => [128.0.0.0, 191.255.0.0]


        Addresses begin with 10xx
        Are for medium to large sized networks.
        Subnet Mask: 255.255.0.0 (16 bits)
        Number of Networks: 16,382
        Number of Hosts per Network: 65,534

  - **Class C** => [192.0.0.0, 223.255.255.0]

        Addresses begin with 110x
        Are used in small local area networks (LANs).
        Subnet Mask: 255.255.255.0 (24 bits)
        Number of Networks: 2,097,150
        Number of Hosts per Network: 254

  - **Class D** => [224.0.0.0, 239.255.255.255]

        Addresses begin with 1110
        Are not allocated to hosts and are used for multicasting.
        Number of Networks: N/A
        Number of Hosts per Network: Multicasting

  - **Class E** => [240.0.0.0, 254.255.255.255]

        Addresses begin with 1111, or 240 to 254 decimal.
        Are not allocated to hosts and are reserved for research purposes.
        Number of Networks: N/A
        Number of Hosts per Network: Research/Reserved/Experimental
