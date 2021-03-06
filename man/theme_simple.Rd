% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_simple.R
\name{theme_simple}
\alias{theme_simple}
\title{A simple ggplot theme}
\usage{
theme_simple(base_size = 11, base_family = "", grid = FALSE, mode = "light")
}
\arguments{
\item{base_size}{Base text size}

\item{base_family}{Base font family}

\item{grid}{Logical, should major grid lines be drawn}

\item{mode}{Background color mode, either "light" (default) or "dark"}
}
\description{
A simple theme for ggplot with thin boxes around plot regions
    and clean facet labels
}
\examples{
library(ggplot2)
g <- ggplot(CO2) +
    aes(x = conc, y = uptake, color = Plant) +
    geom_point() +
    facet_grid(Treatment ~ Type)

g + theme_simple()
g + theme_simple(grid = TRUE)
g + theme_simple(grid = TRUE, mode = "dark")
}
