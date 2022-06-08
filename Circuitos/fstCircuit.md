---
title: First Circuit
author: Daniel Sanchez
header-includes:
    - \usepackage{circuitikz}
---

## An Example

$$\begin{circuitikz} \draw
(0,0) to[battery] (0,4)
    to[ammeter] (4,4) -- (4,0)
    to[lamp] (0,0);
\end{circuitikz}$$
