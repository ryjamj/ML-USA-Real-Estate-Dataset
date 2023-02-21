# App: NJRealEstateMapping
# Date: 02/20/2023
# Purpose: To view NJ real estate locations in a r shiny environment.

################################################################################################
################################################################################################
# Sec 2: Libraries & Input Files

# Libraries
library(shiny) # How we create the app.
library(shinycssloaders) # Adds spinner icon to loading outputs.
library(shinydashboard) # The layout used for the ui page.
library(shinyWidgets) # more options to work with shiny, like inputs
library(leaflet) # Map making. Leaflet is more supported for shiny.
library(leaflet.extras)
library(leaflegend) # custom legend functions for leaflet
library(leafem) #leaflet extension.
library(dplyr) # Used to filter data for plots.
library(DT) # Used to create more efficient data table output.
library(readxl) # read in xlsx files.

# Input Data Files: csv
sitesFile <- read_excel("data/NJLocationData.xlsx")


################################################################################################
################################################################################################
# Sec 3: Custom Functions, Values and Lists

# HouseStatusList
HouseStatusList <- as.list(unique(sitesFile$status))
HouseStatusList <- unique(unlist(HouseStatusList, recursive=F))
HouseStatusList <- HouseStatusList[order(names(setNames(HouseStatusList, HouseStatusList)))]

# Price
minSitePrice <- min(sitesFile$price)
maxSitePrice <- max(sitesFile$price)

# Bed
minSiteBed <- min(sitesFile$bed)
maxSiteBed <- max(sitesFile$bed)

# Bath
minSiteBath <- min(sitesFile$bath)
maxSiteBath <- max(sitesFile$bath)

# acre_lot
minSiteAcreLot <- min(sitesFile$acre_lot)
maxSiteAcreLot <- max(sitesFile$acre_lot)

# house_size
minSiteHouseSize <- min(sitesFile$house_size)
maxSiteHouseSize <- max(sitesFile$house_size)