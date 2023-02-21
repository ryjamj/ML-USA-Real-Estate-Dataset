# App: SSPS Demo

################################################################################################
################################################################################################
# Sec 2. The UI (HTML Page)

ui <- dashboardPage(
  title = "NJ Rea Estate Location Pratice Map_RJ Demo",
  
  dashboardHeader(
    title = "NJ Rea Estate Location Pratice Map_RJ Demo"
  ), #end dashboardHeader
  
  
  dashboardSidebar(
    HTML("<h3 style='text-align:center'; class='parallax'>Instructions</h3>
         <p style='text-align:left'; class='parallax_description'>Use filters to narrow down selection if desired.</p>"),
    hr(),
    pickerInput(inputId="StatusInput", label="Select Status of House", choices=HouseStatusList, selected=HouseStatusList, multiple=TRUE),
    sliderInput("PriceSliderInput", label = h3("Min & Max Price"), min = minSitePrice, max = maxSitePrice, value = c(minSitePrice, maxSitePrice)),
    sliderInput("BedSliderInput", label = h3("Min & Max Bed"), min = minSiteBed, max = maxSiteBed, value = c(minSiteBed, maxSiteBed)),
    sliderInput("BathSliderInput", label = h3("Min & Max Bath"), min = minSiteBath, max = maxSiteBath, value = c(minSiteBath, maxSiteBath)),
    sliderInput("AcreLotSliderInput", label = h3("Min & Max Acre Lot"), min = minSiteAcreLot, max = maxSiteAcreLot, value = c(minSiteAcreLot, maxSiteAcreLot)),
    sliderInput("HouseSizeSliderInput", label = h3("Min & Max House Size"), min = minSiteHouseSize, max = maxSiteHouseSize, value = c(minSiteHouseSize, maxSiteHouseSize))
  ), # end dashboardSidebar
  
  dashboardBody(
    # Header Box
    fluidRow(
      box(
        width=NULL, status="primary",
        HTML(
          "
        <html>
          <head>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
              img {
                display: block;
                margin-left: auto;
                margin-right: auto;
              }
            </style>
          </head>
          <body>
            <div class='col-md-2'>
              <a href='https://github.com/ryjamj'><img src='githubrjlogo.jpg' width='120' height='120' class='center'></a>
            </div>
            <div class='col-md-9'>
              <h1 style='text-align:center'; class='parallax'><strong>DEMO:</strong> NJ Rea Estate Location Pratice Map Demo</h1>
              <p style='text-align:center'; class='parallax_description'>A web tool used to visualize New Jersey Real Estate data in a R Shiny Environment.</p>
              <p style='color:red; text-align:center'; class='parallax_description'>DISCLAIMER: This tool is for personal use only for training purposes in mapping and visualizing data.</p>
            </div>
          </body>
        </html>
        "
        ) #end HTML
      ) #end box
    ), #end fluidRow
    
    ## Output: Leaflet Map "mapA"
    fluidRow(
      box(
        width=NULL, status="primary",
        shinycssloaders::withSpinner(leafletOutput(outputId="mapA", height=600))
      ) #end box
    ) #end fluidRow
    
  ) #end dashboardBody
) #end dashboardPage