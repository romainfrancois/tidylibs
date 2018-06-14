library(glue)
library(purrr)

# this needs bcp:
#
# brew install boost-bcp

bcp <- function(libs){
  walk(libs, ~{
    cmd <- glue("bcp --boost=bh/inst/include/ {.x} inst/include/")
    system(cmd, intern = TRUE)
  })
}

bcp(c("shared_ptr", "scoped_ptr", "weak_ptr", "unordered_map", "unordered_set"))
