#' @title A simple ggplot theme
#'
#' @description A simple theme for ggplot with thin boxes around plot regions
#'     and clean facet labels
#'
#' @param base_size Base text size
#' @param base_family Base font family
#' @param grid Logical, should major grid lines be drawn
#'
#' @importFrom ggplot2 element_text element_line element_rect element_blank theme_light theme rel
#' @importFrom grid unit
#'
#' @examples
#' library(ggplot2)
#' g <- ggplot(mpg) +
#'     aes(x = displ, y = hwy) +
#'     geom_point(color = "grey40") +
#'     geom_smooth(method = "loess", color = "red3", span = 1, se = FALSE) +
#'     facet_wrap( ~ drv, nrow = 1)
#'
#' g + theme_simple()
#' g + theme_simple(grid = TRUE)
#' @export
theme_simple <- function(base_size = 11, base_family = "", grid = FALSE) {
    half_line <- base_size / 2
    x <- theme_light(base_size = base_size, base_family = base_family) +
        theme(panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.ticks.length = unit(half_line / 2.2, "pt"),
              strip.background = element_rect(fill = NA, colour = NA),
              strip.text.x = element_text(colour = "grey30"),
              strip.text.y = element_text(colour = "grey30"),
              axis.text = element_text(colour = "grey30"),
              axis.title = element_text(colour = "grey30"),
              legend.title = element_text(colour = "grey30", size = rel(0.9)),
              panel.border = element_rect(fill = NA, colour = "grey70", size = rel(1.1)),
              legend.key.size = unit(0.9, "lines"),
              legend.text = element_text(size = rel(0.7), colour = "grey30"),
              legend.key = element_rect(colour = NA, fill = NA),
              legend.background = element_rect(colour = NA, fill = NA),
              plot.title = element_text(colour = "grey30", size = rel(1)),
              plot.subtitle = element_text(colour = "grey30", size = rel(.85)))
    if(grid) {
        x <- x + theme(panel.grid.major = element_line(size = 0.2))
    }
    return(x)
}
