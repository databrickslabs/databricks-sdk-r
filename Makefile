.PHONY: deps gen check

deps:
	@echo "Install dependencies"
	@Rscript -e "if (!require(devtools)) install.packages('devtools', repos = 'https://cran.rstudio.com')"
	@Rscript -e "devtools::install_dev_deps('.')"
	
gen:
	oac


doc: deps
	@echo "Making *.Rd files"
	@Rscript -e "devtools::document();"

build: gen doc
	@echo "Building tarball"
	@Rscript -e "devtools::install(upgrade = FALSE);"

check:
	@echo "run R CMD check on packages"
	@set -e ; \
	cleanup () { rm *.tar.gz; rm -fr *.Rcheck; } ; \
	trap cleanup EXIT ; \
	for package in paws.common make.paws $$(find cran -mindepth 1 -maxdepth 1) ; do \
		R CMD build $$package ; \
		R CMD check --as-cran --run-donttest --no-manual $$(basename $$package)_*.tar.gz ; \
	done ;
