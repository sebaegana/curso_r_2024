#install.packages("pdftools")

library(pdftools)
library(stringr)

border_patrol <- pdf_text("ejemplo_pdf/usbp_stats_fy2017_sector_profile.pdf")

head(border_patrol)

length(border_patrol)

border_patrol[1]

sector_profile <- border_patrol[1]
sector_profile <- strsplit(sector_profile, "\n")
sector_profile <- sector_profile[[1]]

head(sector_profile)

sector_profile <- trimws(sector_profile)

sector_profile <- sector_profile[grep("Miami", sector_profile):
                                   grep("Nationwide Total", sector_profile)]

sector_profile <- str_split_fixed(sector_profile, " {2,}", 10)

sector_profile <- data.frame(sector_profile)

names(sector_profile) <- c("sector",
                           "agent_staffing",
                           "apprehensions",
                           "other_than_mexican_apprehensions", 
                           "marijuana_pounds",
                           "cocaine_pounds",
                           "accepted_prosecutions",
                           "assaults",
                           "rescues",
                           "deaths")






