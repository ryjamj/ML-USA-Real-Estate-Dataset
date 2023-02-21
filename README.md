# USA-Real-Estate-Dataset Price Prediction Model (python) and Geolocation Mapping (R)(personal project)

## Project Description
This is a personal project of mine to develop and work on my own machine learning skills.  This project uses publicly available real estate data to build a regression model to predict home prices in certain areas.  The regression model was developed using python in a Jupyter Notebook environment.  The model is a simple linear regression built using sklearn & pandas.

As a bonus, I also created an interactive web app for viewing and filtering locations of a subset of the real estate data.  This was done in an r shiny environment and hosted on shiny.io.  I used a google api and georeferenced the provided street address to convert its latitude and longitude coordinates.

### Project Goals
- To view and explore data.
- Clean data and remove outliers.
- Create price prediction model on small -to- medium size homes (see home_price_model.pkl for results).
- Extract latitude and longitude information using google services.
- Export New Jersey subset for mapping purposes.
- Map New Jersey real estate sites in r shiny environment (see external r shiny project for results).


***
## Table of Contents
- **data**: folder that holds that publicly available real estate data (see # The Data section below for reference)
- **Predict Prices_Jupyter Notebook.ipynb**: Jupyter Notebook file that explores cleans and the data, creates the home price predict model, and georeferences the street address input used by the r shiny app.
- **home_price_model.pkl**: exported linear regression model to predict home prices, trained using the publicly available real estate data.
- **NJRealEstateMapping**: folder that contains the r shiny app for mapping locations.
    - **data**: folder holding a subset of the real estate data, data particular only for NJ.
    - **rsconnect**: folder for shiny.io account.
    - **global.r**: r file that holds the global variables and inputs for the r shiny app.
    - **ui.r**: r file that holds the ui components of the r shiny app.
    - **server.r**: r file that holds the server components of the r shiny app.


***
## How to Install and Run the Project
The project used the following software and environments...
- [Python](https://www.python.org/) as the programming language for the ML development.
- [Jupyter Notebook](https://jupyter.org/) as the python IDE.
- [R](https://www.r-project.org/) as the programming language for the web app development.
- [RStudio] as the R IDE.
- [shiny.io](https://www.shinyapps.io/) as the web app hosting platform.


***
## Additional References
- R Shiny Web App Link: https://ryjamesj.shinyapps.io/NJRealEstateMapping/
- Real Estate Data (accessed February 13, 2023): SAKIB , A. (2023). USA Real Estate Dataset. https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset?resource=download
