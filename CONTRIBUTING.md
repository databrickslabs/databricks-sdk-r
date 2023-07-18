Contributing guidelines
---


# Developing SDK

Please read the [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html) manual in case of having any difficulties with `make check`.

## Installing tools

Start with `make deps` if you're running a clean checkout.

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
load_all(); DatabricksClient(profile = 'demo')$do('GET', '/api/2.0/scim/Me')
```

### Debugging

* insert `browser()` whenever necessary and use `Q` to quit interactiv debugging
* see more at https://adv-r.hadley.nz/debugging.html