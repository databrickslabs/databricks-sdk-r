.PHONY: deps gen check

deps:
	@echo "✅ Installing dependencies"
	@Rscript -e "if (!require(devtools)) install.packages('devtools', repos = 'https://cran.rstudio.com')"
	@Rscript -e "devtools::install_dev_deps('.')"
	
gen:
	@echo "✅ Regenerating files from OpenAPI"
	oac

doc: deps gen
	@echo "✅ Making *.Rd files"
	@Rscript -e "devtools::document()"

build: doc
	@echo "✅ Building tarball"
	@Rscript -e "devtools::install(upgrade = FALSE)"

check: doc
	@echo "✅ run R CMD check on packages"
	@set -e ; \
	cleanup () { rm *.tar.gz; rm -fr *.Rcheck; } ; \
	trap cleanup EXIT ; \
	R CMD build . ; \
	R CMD check --as-cran --run-donttest --no-manual databricks_*.tar.gz ; \