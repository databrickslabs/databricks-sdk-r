.PHONY: deps gen check

deps:
	@echo "✅ Installing dependencies"
	@Rscript -e "if (!require(devtools)) install.packages('devtools', repos = 'https://cran.rstudio.com')"
	@Rscript -e "devtools::install_dev_deps('.')"
	
gen: # invoked by Databricks employees
	@echo "✅ Regenerating files from OpenAPI"
	@oac
	@Rscript -e "devtools::document()"

tarball:
	@echo "✅ Building tarball"
	@R CMD build .

test:
	@Rscript -e "devtools::test()"

check: gen
	@echo "✅ run R CMD check on packages"
	@set -e ; \
	cleanup () { rm *.tar.gz; rm -fr *.Rcheck; } ; \
	trap cleanup EXIT ; \
	R CMD build . ; \
	R CMD check --as-cran --run-donttest --no-manual databricks_*.tar.gz ;