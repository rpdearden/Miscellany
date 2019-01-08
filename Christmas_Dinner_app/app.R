#
# This is a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyTime)
library(tidyverse)
library(lubridate)
library(plotrix)


ui <- fluidPage(
  
  titlePanel("Christmas Dinner Plan"),
  
  inputPanel(
    numericInput("TurkeyWeight", label = "Weight of turkey (g)", 
                 value = 4500, min = NA, max = NA, step = NA),
    numericInput("BumsOnSeats", label = "Number of people",
                 value =6, min = 1, max = NA, step = 1),
    timeInput("DinsTime", "Dinner Time:", value = strptime("13:00", "%H"), seconds = FALSE)
    
    ),
  
  mainPanel(
    ###-----------------------------GANNT CHART---------------------------------###
    h2("Timetable"),
    plotOutput("DinnerPlot"),
    hr(),
    ###-----------------------------TURKEY---------------------------------###
    h2("Ingredients"),
    p("Recipe taken from",
    a("here", href="https://www.theguardian.com/lifeandstyle/wordofmouth/2010/dec/20/how-to-cook-perfect-christmas-dinner"),
    ", on the Guardian website."),
    h3("Turkey"),
    strong("For the turkey:"),
    p("-1 turkey, of weight above, with giblets"),
    p("-170g butter"),
    p("-half an onion"),
    p("-bay leaf"),
    p("-piece of cook's muslin"),
    br(),
    strong("For the gravy:"),
    p("-1 tbsp plain flour"),
    p("-4tbsp madeira"),
    p("-568ml hot poultry stock or water"),
    hr(),
    ###-----------------------------POTATOES---------------------------------###
    h3("Potatoes"),
    p("Rather than being boiled, mashed, or stuck in a stew, the potatoes are roasted from",
      a("here", href="https://www.theguardian.com/lifeandstyle/wordofmouth/2010/dec/20/how-to-cook-perfect-christmas-dinner"),
      ", which has the recipe. Also whack in any parsnips/carrots you might have for less time (see link)"),
      strong("Ingredients:"),
    p(textOutput("Potatoweight")),
    p(textOutput("Goosefat")),
    hr(),
    ###-----------------------------BREAD SAUCE---------------------------------###
    h3("Bread sauce"),
    p("This makes a juful: about 6-8 people"),
    strong("Ingredients:"),
    p("- 1 small onion"),
    p("-5 cloves"),
    p("-A bay leaf"),
    p("-500ml whole milk"),
    p("-115g white breadcrumbs"),
    p("-1 tbsp clotted cream (optional)"),
    p("-Nutmeg, to grate"),
    p("-Cayenne pepper, to serve"),
    hr(),
    ###-----------------------------STUFFING---------------------------------###
    h3("Stuffing"),
    p("Can be made the night before and left in the fridge.  Makes 14 balls"),
    strong("Ingredients:"),
    p("-Knob of butter"),
    p("-1 large onion, finely chopped"),
    p("-75g white breadcrumbs"),
    p("-Small bunch of sage leaves, finely chopped"),
    p("-Grated zest of 0.5 lemon"),
    p("-450g pork sausagemeat"),
    p("-Nutmeg, to grate"),
    hr(),
    
    
     ###-----------------------------SPROUTS---------------------------------###
    h3("Sprouts"),
    p("Also nice to spritz 'em up with a splash of lemon juice."),
    strong("Ingredients:"),
    p(textOutput("Sproutsweight")),
    p(textOutput("Almonds")),  
    hr(),
    
    ###-----------------------------TIME TABLE---------------------------------###
    h2("Exact timings"),
    tableOutput("TimeTable")

    
     )

  
)


server <- function(input, output, session) {
  
  #TurkeyTimings
  Time.format<-"%H:%M"
  TurkeyCookTime <- reactive(((((input$TurkeyWeight)/450)*20)+20)*60)
  TurkeyStanding <- 30*60
  TurkeyPrep <- 30*60
  PotatoCook <- 60*60
  PotatoBoil <- 60*15
  PotatoPrep <- 60*30
  Sprouts <- 60*25
  DinnertimeG <- reactive(as.POSIXct(input$DinsTime))
  DinnerTimeP <- reactive(strftime(input$DinsTime, Time.format))
  ####Turkeystuff
  #Turkey standing and Stuffing
  TurkeyStandStartG <-reactive(as.POSIXct(input$DinsTime-TurkeyStanding))
  TurkeyStandStartP <- reactive(strftime(input$DinsTime-TurkeyStanding, Time.format))
  #Turkey Cooking
  TurkeyCookStartG <-reactive(as.POSIXct(input$DinsTime-(TurkeyStanding+TurkeyCookTime())))
  TurkeyCookStartP <- reactive(strftime(input$DinsTime-(TurkeyStanding+TurkeyCookTime()), Time.format))
  #Turkey Prep and Oven heating 
  TurkeyPrepStartG <- reactive(as.POSIXct(input$DinsTime-(TurkeyStanding+TurkeyCookTime()+TurkeyPrep)))
  TurkeyPrepStartP <- reactive(strftime(input$DinsTime-(TurkeyStanding+TurkeyCookTime()+TurkeyPrep), Time.format))
  
  ###Potatostuff
  #Cookem
  PotatoCookStartG <- reactive(as.POSIXct(input$DinsTime-(PotatoCook)))
  PotatoCookStartP <- reactive(strftime(input$DinsTime-(PotatoCook), Time.format))
  #Parboilem
  PotatoBoilStartG <- reactive(as.POSIXct(input$DinsTime-(PotatoCook+PotatoBoil)))
  PotatoBoilStartP <- reactive(strftime(input$DinsTime-(PotatoCook+PotatoBoil), Time.format))
  #Prep em
  PotatoPrepStartG <- reactive(as.POSIXct(input$DinsTime-(PotatoCook+PotatoBoil+PotatoPrep)))
  PotatoPrepStartP <- reactive(strftime(input$DinsTime-(PotatoCook+PotatoBoil+PotatoPrep), Time.format))
  
  ###Sundries
  #Sprouts and bread sauce
  SproutsG <- reactive(as.POSIXct(input$DinsTime-(Sprouts)))
  SproutsP <- reactive(strftime(input$DinsTime-(Sprouts), Time.format))
  
  DinnerPlan <- reactive(tribble(
    ~Task,             ~Start,             ~End,               ~Category,
    "Heat Oven",       TurkeyPrepStartP(),  TurkeyCookStartP(),  "Prep",
    "Prepare Turkey",  TurkeyPrepStartP(),  TurkeyCookStartP(),  "Prep",
    "Cook Turkey",     TurkeyCookStartP(),  TurkeyStandStartP(), "Cooking",
    "Turkey Stands",   TurkeyStandStartP(), DinnerTimeP(),       "Prep",
    "Cook Stuffing",   TurkeyStandStartP(), DinnerTimeP(),       "Cooking",
    "Prepare Vegetables",PotatoPrepStartP(),PotatoBoilStartP(),  "Prep", 
    "Parboil Vegetables",PotatoBoilStartP(),PotatoCookStartP(),  "Prep",
    "Cook Vegetables",   PotatoCookStartP(),DinnerTimeP(),       "Cooking",
    "Do Sprouts",       SproutsP(),         DinnerTimeP(),       "Cooking",
    "Do Bread Sauce",   SproutsP(),         DinnerTimeP(),       "Cooking",
    "Do Gravy",   SproutsP(),         DinnerTimeP(),       "Cooking"
  ))

  
  
  

  gantt.info<-reactive(list(labels=c("Heat Oven","Prepare Turkey","CookTurkey","Turkey Stands", "Cook Stuffing","Prep Vegetables","Parboil Vegetables", "Cook Vegetables","Do Sprouts","Do Bread Sauce","Do Gravy"),
                       starts=c(TurkeyPrepStartG(),TurkeyPrepStartG(),TurkeyCookStartG(),TurkeyStandStartG(),TurkeyStandStartG(),PotatoPrepStartG(),PotatoBoilStartG(),PotatoCookStartG(),SproutsG(),SproutsG(),SproutsG()),
                       ends=c(TurkeyCookStartG(),TurkeyCookStartG(),TurkeyStandStartG(),DinnertimeG(),DinnertimeG(),PotatoBoilStartG(),PotatoCookStartG(),DinnertimeG(),DinnertimeG(),DinnertimeG(),DinnertimeG()),
                       Category=c("Prep","Prep","Cooking","Prep","Cooking","Prep","Prep","Cooking","Cooking","Cooking","Cooking")
                       ))
  
  TaskCols <- c("black",#Heat Oven
                "#7688A9",#TurkeyPrep
                "#2D4571",#TurkeyCook
                "#051838",#TurkeyStand
                "#AA8239",#StuffingCook
                "#E297AF",#PotatoPrep
                "#973253",#PotatoBoil
                "#4B0018",#PotatoCook
                "#629833",#Sprouts
                "#BCE498",#Bread Sauce
                "#244C00"#Gravy
                )
  Lowerlimit <-reactive(as.POSIXct(floor_date(TurkeyCookStartG(),unit="hour")-1800))
  Upperlimit <-reactive(as.POSIXct(floor_date(DinnertimeG(),unit="hour")+3600))
  # Limits <- as.POSIXct(c(Lowerlimit,Upperlimit),format=Time.format)
  Gridlines<-as.POSIXct(strptime(c("00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00",
                                   "08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30",
                                  "14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:00"),format=Time.format))
  Gridlabels<-
    c("00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00","07:30","08:00",
      "08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30",
      "14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:00")

#Output
  
output$Potatoweight <- renderText(
  paste("-",signif((((input$BumsOnSeats)/6)*1.2),2),"kg of potatoes")
) 

output$Goosefat <- renderText( 
  paste("- A jar of goose fat OR",signif((((input$BumsOnSeats)/6)*4),2),"tbsp olive oil")
)

output$Sproutsweight <- renderText(
  paste("-",signif((((input$BumsOnSeats)/6)*500),3),"g of sprouts")
) 

output$Almonds <- renderText(
  paste("-",signif((((input$BumsOnSeats)/6)*100),3),"g of almonds")
) 


 output$TimeTable <- renderTable(

   DinnerPlan()

 )
 
 
 output$DinnerPlot <- renderPlot(

   gantt.chart(gantt.info(),main="", xlim=c(Lowerlimit(),Upperlimit()), vgridpos=Gridlines,vgridlab=Gridlabels,
               priority.legend=FALSE,hgrid=TRUE,taskcolors=TaskCols
               )

 )
 
 
 
}

shinyApp(ui, server)


