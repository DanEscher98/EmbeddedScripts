# Modelos OSI y TCP/IP

## Modelo OSI

El modelo OSI (Open System Interconnection) trata de una arquitectura
no física, más bien conceptual, la cual estandariza el cómo se dividen
las capas de conexión. Se divide en 7 capas:

- **Capa 7 Aplicación:** Proporciona servicios de red a las
    aplicaciones del usuario final.
- **Capa 6 Presentación:** Asegura que la información de la aplicación
    de un sistema sea legible para la capa de aplicación de otro sistema.
- **Capa 5 Sesión:** Establece, administra y termina las sesiones
    entre dos hosts que se comunican. Gestiona el intercambio de datos.
- **Capa 4 Transporte:** Define los servicios para segmentar,
    transferir y reensamblar los datos para las comunicaciones
    individuales entre los dispositivos finales.
- **Capa 3 Red:** Ofrece conectividad (lógica) y selección de ruta
    entre dos sistemas host que puedan estar separados. Aquí se
    incolucran los routers y switch de capa 3.
- **Capa 2 Enlace de Datos:** Define cómo serán formateados los datos
    para su transmisión y cómo se controla el acceso a medios físicos.
    En esta capa trabajan los switches de capa 2.
- **Capa 1 Física:** Es el nivel más bajo del modelo. Aquí se ven
    incolucrados todos los elementos tangibles o medibles como
    cableado, conectores físicos, distancias de transimicón, etc. En
    esta capa se realiza la transimición de bits (O'S y 1's).


## Comparison between OSI and TCP

| N | OSI Layer    | TCP Stack   | PDU     | Topics         | Devices  |
| - | :----------- | :---------- | :------ | :------------- | :------- |
| 1 | Application  | Application | Data    | | |
| 2 | Presentation | | | |
| 3 | Session      | | | |
| 4 | Transport    | Transport   | Segment | `TCP/UDP port` | |
| 5 | Network      | Internet    | Packet  | `IP Address`   | Routers  |
| 6 | Data         | Net access  | Frame   | `Eth MAC addr` | Switches |
| 7 | Physical     |             |         |                | Hubs     |

### Important Ports

#### TCP applications
- `FTP`: 21
- `SSH`: 22
- `Telnet`: 23
- `HTTP`: 80
- `HTTPS`: 443

#### UDP applications
- `TFTP`: 69
- `SNMP`: 161

#### TCP and UDP applications
- `DNS`: 53
- `SMTP` email: 25

### Cisco TCP/IP Stack Layer Definition

- Application: Represents data users, encodes and controls the dialog.
- Transport: Supports communication between end devices across a
    diverse network.
- Provides logical addressing and determines the best path through the
    network.
- Controls the hardware devices and media that make up the network.


Las capas 7, 6 y 5 se les denomina "capas superiores" y son
especialmente importantes para los desarrolladores, mientras que las
capas 4 a 1 se les llama "capas inferiores" y son sumamente
importantes para los ingenieros de red.

Cada capa cuenta con sus familias de protocolos, los cuales se verán
más delante.

## Acrónimos para recordar cada capa del modelo OSI

(Physical, Data, Network, Transport, Session, Presentation, Application)

- Please Don't Need Those Stupid Packets Anyway
- Please Do Not Throw Sausage Pizza Away
- Please Do Not Teach Stupid Pointless Acronyms
- Please Do Not Take Sales People's Advice
