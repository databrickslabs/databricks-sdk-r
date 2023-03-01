Contributing guidelines
---


# Developing SDK

## Installing tools

```
pip3 install -U radian

brew install r fribidi libgit2
```

To set up dev workstation, you have to install devtools package

```
install.packages("devtools")
```

## Devloop

In console, execute

```
library(devtools);
load_all(".");
```

if you get error on `#include <fribidi.h>`, do `brew install fribidi`.

HTTP client devloop:

```
load_all(); .ApiClient(profile = 'demo')$do('GET', '/api/2.0/scim/Me')
```