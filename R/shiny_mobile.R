###################################
# save as app.R before using
###################################
library(shiny)
library(shinyMobile)
library(echarts4r)


library(datasets)
data(faithful)

library(dplyr)

plot <- faithful %>%
    e_chart() %>%
    e_boxplot(eruptions) %>%
    e_title("Old Faithful Eruptions", "BoxPlot", sublink = "https://ilivethedata.net")


shiny::shinyApp(
    ui = f7Page(
        title = "My app",
        f7SingleLayout(
            navbar = f7Navbar(
                title = "Old Faithful (Mobile Friendly)",
                hairline = TRUE,
                shadow = TRUE
            ),
            toolbar = f7Toolbar(
                position = "bottom",
                f7Link(label = "Link 1", src = "https://www.google.com"),
                f7Link(label = "Link 2", src = "https://www.google.com", external = TRUE)
            ),
            # main content
            f7Shadow(
                intensity = 16,
                hover = TRUE,
                f7Card(
                    title = "Card header",
                    plot,
                    footer = tagList(
                        f7Button(color = "blue", label = "My button", src = "https://www.google.com"),
                        f7Badge("Badge", color = "green")
                    )
                )
            )
        )
    ),
    server = function(input, output) {
    }
)
