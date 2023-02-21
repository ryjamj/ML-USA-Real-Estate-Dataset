# App: SSPS Demo

################################################################################################
################################################################################################
# Sec 3. The Server (function)

server <- function(input, output, session) {
  
  ##################################################################
  ####### Reactive Data Sets ########
  
  # note: filters working better when building a subset below with single values & vectors
  sitesRec <- reactive({
    sitesFile
  })
  

  ##################################################################
  ######## Site Specific Map ########
  
  #Base Map Creation
  output$mapA <- renderLeaflet({
    
    # Create the Base Map
    SiteMap = leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
      
      # Add tile layer upon launch
      addProviderTiles(
        providers$Esri.WorldGrayCanvas,
        options = providerTileOptions(
          updateWhenZooming = FALSE, # map won't update tiles until zoom is done
          updateWhenIdle = TRUE)) %>% # map won't load new tiles when panning
      
      # Extra Provider Tiles to choose from
      addProviderTiles(provider=providers$Esri.WorldGrayCanvas, group="WorldGrayCanvas") %>%
      addProviderTiles(provider=providers$Esri.WorldStreetMap, group="WorldStreetMap") %>%
      addProviderTiles(provider=providers$Esri.DeLorme, group="DeLorme") %>%
      addProviderTiles(provider=providers$Esri.WorldTopoMap, group="WorldTopoMap") %>%
      addProviderTiles(provider=providers$Esri.WorldImagery, group="WorldImagery") %>%
      addLayersControl(
        baseGroups = c("WorldGrayCanvas", "WorldStreetMap", "DeLorme", "WorldTopoMap", "WorldImagery"),
        options = layersControlOptions(collapsed = FALSE)) %>%
      
      # Set starting view / zoom level
      setView(lng = -75.0, lat = 40.10, zoom = 8)

  }) #end renderLeaflet
  
  
  #Incremental Changes to the Map / Responses to filters
  observe({
    try({
      
      # Subset of sitesRec() data, with custom mapping options.
      siteDataTable <- sitesRec()
      siteDataTable <- siteDataTable %>% subset((status %in% input$StatusInput))
      siteDataTable <- siteDataTable %>% filter((price >= input$PriceSliderInput[1]), (price <= input$PriceSliderInput[2]))
      siteDataTable <- siteDataTable %>% filter((bed >= input$BedSliderInput[1]), (bed <= input$BedSliderInput[2]))
      siteDataTable <- siteDataTable %>% filter((bath >= input$BathSliderInput[1]), (bath <= input$BathSliderInput[2]))
      siteDataTable <- siteDataTable %>% filter((acre_lot >= input$AcreLotSliderInput[1]), (acre_lot <= input$AcreLotSliderInput[2]))
      siteDataTable <- siteDataTable %>% filter((house_size >= input$HouseSizeSliderInput[1]), (acre_lot <= input$HouseSizeSliderInput[2]))

      # Call the Map
      SiteMapProxy = leafletProxy(mapId="mapA") %>%
        
        # Clean Map
        clearGroup(group=c("SiteGroup")) %>%
        
        # Add Sites
        addCircleMarkers(
          data = siteDataTable,
          # layerId = ~SiteUUID,
          lng = ~longitude,
          lat = ~latitude,
          radius = 2,
          color = "#005AB5",
          group = "SiteGroup",
          labelOptions = labelOptions(
            noHide = FALSE,
            textOnly = FALSE,
            textsize = "7px",
            opacity = 0.8,
            direction = 'top'),
          popup = paste(
            "<b>price:</b>", siteDataTable$price, "<br>",
            "<b>bed:</b>", siteDataTable$bed, "<br>",
            "<b>bath:</b>", siteDataTable$bath, "<br>",
            "<b>acre_lot:</b>", siteDataTable$acre_lot, "<br>",
            "<b>house_size:</b>", siteDataTable$house_size, "<br>",
            "<b>status:</b>", siteDataTable$status)
        )
    }) #end try
  }) #end Observe
  
} #endServer