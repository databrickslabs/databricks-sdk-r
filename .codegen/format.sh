# TODO: figure out how to make line width of 80 chars
# See: https://yihui.org/formatr/#8-global-options 
Rscript -e "options(formatR.indent=2); options('formatR.width'=80); formatR::tidy_dir(path = 'R', recursive = TRUE)"
