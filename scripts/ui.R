library(shiny)
library(shinydashboard)

shinyUI(
  navbarPage("🛒 E-Commerce Recommendation System",
             id = "main_navbar",
             tabPanel("Home",
                      fluidPage(
                        # Centered Search and First Row with User ID on left
                        fluidRow(
                          column(3),
                          column(6,
                                 div(style = "text-align: center;",
                                     textInput("search", "🔍 Search Products...", "")
                                 )
                          ),
                          column(3, div(style = "text-align: right;",
                                        actionButton("filter_btn", "⚙️ Filter", class = "btn-primary", style = "margin-top: 25px;"),
                                        br(),
                                        uiOutput("filter_msg")
                          ))
                        ),
                        
                        # User ID moved to top left
                        fluidRow(
                          column(4, textInput("user_id", "👤 Enter User ID", "")),
                          column(4, numericInput("num_reco", "No. of Recommendations", value = 5, min = 1, max = 20)),
                          column(4)
                        ),
                        
                        tags$hr(),
                        h4("🎯 Recommended Products"),
                        uiOutput("recommendation_ui"),
                        
                        tags$hr(),
                        h4("🔥 Popular Products"),
                        uiOutput("trending_ui")
                      )
             )
  )
)