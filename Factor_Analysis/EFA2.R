library(palmerpenguins)
library(tidyverse)
library(psych)
library(flextable)


# table set-up ----

flex <- function(data, title=NULL) {
  # this grabs the data and converts it to a flextbale
  flextable(data) %>%
    # this makes the table fill the page width
    set_table_properties(layout = "autofit", width = 1) %>%
    # font size
    fontsize(size=10, part="all") %>%
    #this adds a ttitlecreates an automatic table number
    set_caption(title, 
                autonum = officer::run_autonum(seq_id = "tab", 
                                               pre_label = "Table ", 
                                               post_label = "\n", 
                                               bkm = "anytable")) %>%
    # font type
    font(fontname="Times New Roman", part="all")
}




fa_table <- function(x, cut) {
  #get sorted loadings
  loadings <- fa.sort(x)$loadings %>% round(3)
  #supress loadings
  loadings[loadings < cut] <- ""
  #get additional info
  add_info <- cbind(x$communality, 
                    x$uniquenesses,
                    x$complexity) %>%
    # make it a data frame
    as.data.frame() %>%
    # column names
    rename("Communality" = V1,
           "Uniqueness" = V2,
           "Complexity" = V3) %>%
    #get the item names from the vector
    rownames_to_column("item")
  #build table
  loadings %>%
    unclass() %>%
    as.data.frame() %>%
    rownames_to_column("item") %>%
    left_join(add_info) %>%
    mutate(across(where(is.numeric), round, 3))
}

# Tables for SimpStructure
fa_table(m1_1, 0.4) %>% flex("PA EFA 1 Factor Solution")
fa_table(m1_2, 0.4) %>% flex("PA EFA 2 Factor Solution")
fa_table(m1_3, 0.4) %>% flex("PA EFA 3 Factor Solution")
fa_table(m1_4, 0.4) %>% flex("PA EFA 4 Factor Solution")
fa_table(m1_4, cut = 0) %>% flex("PA EFA 4 Factor Solution")
fa_table(m1_5, cut = 0.4) %>% flex("PA EFA 5 Factor Solution")


fa_table(m2_1, 0.4) %>% flex("ML EFA 1 Factor Solution")
fa_table(m2_2, 0.4) %>% flex("ML EFA 2 Factor Solution")
fa_table(m2_3, 0.4) %>% flex("ML EFA 3 Factor Solution")
fa_table(m2_4, 0.4) %>% flex("ML EFA 4 Factor Solution")
