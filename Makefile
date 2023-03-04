.PHONY: deps gen check

deps:
	@echo "✅ Installing dependencies"
	@Rscript -e "if (!require(devtools)) install.packages('devtools', repos = 'https://cran.rstudio.com')"
	@Rscript -e "devtools::install_dev_deps('.')"
	
gen:
	@echo "✅ Regenerating files from OpenAPI"
	@oac
	@Rscript -e "devtools::document()"

build: gen
	@echo "✅ Building tarball"
	@Rscript -e "devtools::install(upgrade = FALSE)"

check: gen
	@echo "✅ run R CMD check on packages"
	@set -e ; \
	cleanup () { rm *.tar.gz; rm -fr *.Rcheck; } ; \
	trap cleanup EXIT ; \
	R CMD build . ; \
	R CMD check --as-cran --run-donttest --no-manual databricks_*.tar.gz ; \