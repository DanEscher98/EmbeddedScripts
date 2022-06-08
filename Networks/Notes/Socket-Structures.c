
/*generic socket address structure, which will be
passed in most of the socket function calls*/
struct sockaddr {
    unsigned short   sa_family;     //it represent and address family
    char             sa_data[14];   //The content is interpreted according to the type of address
};

struct sockaddr_in {
    short int            sin_family;//It represents an address family.
    unsigned short int   sin_port;  //A 16-bit port number in Network Byte Order.
    struct in_addr       sin_addr;  //A 32-bit IP address in Network Byte Order.
    unsigned char        sin_zero[8];//You just set this value to NULL as this is not being used.
};

struct in_addr {
   unsigned long s_addr;
};

//This structure is used to keep information related to host.
struct hostent {
    char    *h_name;        //It is the official name of the host.
    char    **h_aliases;    //It holds a list of host name aliases.
    int     h_addrtype;     //It contains the address family
    int     h_length;       //It holds the length of the IP address
    char    **h_addr_list;  //For Internet addresses, is and array of pointers to structure in_addr.
#define h_addr  h_addr_list[0]
};

//This particular structure is used to keep information related to service and associated ports.
struct servent {
   char  *s_name;       //This is the official name of the service.
   char  **s_aliases;   //It holds the list of service aliases.
   int   s_port;        //It will have associated port number.
   char  *s_proto;      //It is set to the protocol used.
};
