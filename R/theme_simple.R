#' @title A simple ggplot theme
#'
#' @description A simple theme for ggplot with thin boxes around plot regions
#'     and clean facet labels
#'
#' @param base_size Base text size
#' @param base_family Base font family
#' @param grid Logical, should major grid lines be drawn
#' @param mode Background color mode, either "light" (default) or "dark"
#'
#' @importFrom ggplot2 element_text element_line element_rect element_blank theme_light theme rel
#' @importFrom grid unit
#'
#' @examples
#' library(ggplot2)
#' g <- ggplot(CO2) +
#'     aes(x = conc, y = uptake, color = Plant) +
#'     geom_point() +
#'     facet_grid(Treatment ~ Type)
#'
#' g + theme_simple()
#' g + theme_simple(grid = TRUE)
#' g + theme_simple(grid = TRUE, mode = "dark")
#' @export
theme_simple <- function(base_size = 11,
                         base_family = "",
                         grid = FALSE,
                         mode = "light") {

    half_line <- base_size / 2
    if(mode == "dark") {
        grey0 <- "grey70"
        grey1 <- "grey30"
        grey2 <- "grey18"
        bg    <- "black"
    } else {
        grey0 <- "grey30"
        grey1 <- "grey70"
        grey2 <- "grey87"
        bg    <- NA
    }

    x <- theme_light(base_size = base_size, base_family = base_family) +
        theme(plot.background = element_rect(fill = bg, colour = NA),
              panel.background = element_rect(fill = bg, colour = NA),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.ticks.length = unit(half_line / 2.2, "pt"),
              strip.background = element_rect(fill = NA, colour = NA),
              strip.text.x = element_text(colour = grey0),
              strip.text.y = element_text(colour = grey0),
              axis.text = element_text(colour = grey0),
              axis.title = element_text(colour = grey0),
              legend.title = element_text(colour = grey0, size = rel(0.9)),
              panel.border = element_rect(fill = NA, colour = grey1, size = rel(1.1)),
              legend.key.size = unit(0.9, "lines"),
              legend.text = element_text(size = rel(0.7), colour = grey0),
              legend.key = element_rect(colour = NA, fill = bg),
              legend.background = element_rect(colour = NA, fill = bg),
              plot.title = element_text(colour = grey0, size = rel(1)),
              plot.subtitle = element_text(colour = grey0, size = rel(.85)),
              plot.caption = element_text(colour = grey0, size = rel(0.8)),
              plot.tag = element_text(colour = grey0, size = rel(1.1)))
    if(grid) {
        x <- x + theme(panel.grid.major = element_line(color = grey2, size = 0.2))
    }
    return(x)
}
