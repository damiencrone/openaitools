
# Set working directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
setwd("..") # Move to parent directory (assuming this script is located in code/)

# Create subdirectories
dir.create("data/", showWarnings = FALSE)

# Imports
library(wikipediacorpus)

# Parameters
topic = "mythical_creatures"
lang = "en"
depth = 0

seed_categories = c("Australian legendary creatures")
# See https://en.wikipedia.org/wiki/Category:Australian_legendary_creatures

sections_to_remove = c("See also",
                       "References",
                       "External links",
                       "Citations",
                       "Notes",
                       "Bibliography",
                       "Sources",
                       "Publications",
                       "Selected publications")

# Scraping ----

category_page_mat = get_category_members_matrix(categories = seed_categories,
                                                namespace = 0,
                                                lang = lang)

articles = list()
for (title in colnames(category_page_mat)) {
  articles[[title]] = get_wikipedia_article(title, lang = lang)
}


# Processing ----

articles = cut_articles_at_headings(unlist(articles), sections_to_remove)

saveRDS(object = articles,
        file = paste0("data/", lang, "_", topic, "_corpus_processed.RDS"))
