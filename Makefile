.PHONY: deps gen check

deps:
	@echo "✅ Installing dependencies"
	@Rscript -e "if (!require(devtools)) install.packages('devtools', repos = 'https://cran.rstudio.com')"
	@Rscript -e "devtools::install_dev_deps('.')"

tarball:
	@echo "✅ Building tarball"
	@R CMD build .

test:
	@Rscript -e "devtools::test()"

fmt:
	@Rscript .codegen/format.R

check: 
	@echo "✅ run R CMD check on packages"
	@set -e ; \
	cleanup () { rm *.tar.gz; rm -fr *.Rcheck; } ; \
	trap cleanup EXIT ; \
	R CMD build . ; \
	R CMD check --as-cran --run-donttest --no-manual databricks_*.tar.gz ;