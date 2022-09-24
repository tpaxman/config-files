# R

## Base R

    fahrenheit_to_celsius <- function(temp_F) {
      temp_C <- (temp_F - 32) * 5 / 9
      return(temp_C) 
    }

note: `return` is optional; variable on last line is returned by default.


## Tidyverse

- define a factor: `factor(colname, ordered = TRUE, levels = c('a', 'b', 'c'))`
- convert column to factor type (using current order of data as factor level order: `df %>% mutate(colname = factor(colname, ordered = TRUE, levels = unique(colname))`
- General sorting of factors approach: `numeric_levels <- sort(unique(numeric_vector))   numeric_factor_vector <- factor(numeric_vector, levels = numeric_levels)`
- Suppress package loading messages: `suppresspackagestartupmessages({library(readxl) ...})`
- Read args from command line: `args <- commandArgs(trailingOnly = TRUE) input_filename <- args[1] sheetname <- args[2]`
- How to reference a column names as a variable: `mtcars %>% filter(get(var) == 4)`



## Non-equi joins

- OPEN GITHUB ISSUE: [join_by(): Syntax for generic joins · Issue #2240 · tidyverse/dplyr](https://github.com/tidyverse/dplyr/issues/2240)

- One guys approach: [In between a rock and a conditional join](https://www.r-bloggers.com/in-between-a-rock-and-a-conditional-join/)

- Another guys approach: [Thought process to choose a Tidyverse approach: join, mutate + map, or other](https://community.rstudio.com/t/thought-process-to-choose-a-tidyverse-approach-join-mutate-map-or-other/2097/7)

- Fuzzy join: [dgrtwo/fuzzyjoin: Join tables together on inexact matching](https://github.com/dgrtwo/fuzzyjoin)

- TEASED IN 2015 FOR DPLYR: [dplyr 0.4.0](https://blog.rstudio.com/2015/01/09/dplyr-0-4-0/)

## Tidyverse

- Filter only if a condition

You could do

    library(dplyr)
    y <- ""
    data.frame(x = 1:5) %>% 
      {if (y=="") filter(., x>3) else filter(., x<3)} %>% 
      tail(1)

or

    data.frame(x = 1:5) %>% 
     filter(if (y=="") x>3 else x<3) %>%  
      tail(1)

or even store your pipe in the veins of

    mypipe <- . %>% tail(1) %>% print
    data.frame(x = 1:5) %>% mypipe

[stackoverflow](https://stackoverflow.com/questions/52001841/filter-argument-in-function-that-defaults-to-make-dplyrfilter-filter-nothing)


## GGPlot

- [Line plot for discrete x-axis](https://stackoverflow.com/questions/35209157/ggplot-line-plot-for-discrete-x-axis):

    ggplot(data, aes(x=factor(year), y=dist, group=1)) +
    geom_line() +
    geom_point()

- [Hide aes legend](https://www.datanovia.com/en/blog/how-to-remove-legend-from-a-ggplot/) `... + guides(color = FALSE, size = FALSE)`

- [Hide geom legend](https://www.datanovia.com/en/blog/how-to-remove-legend-from-a-ggplot/) `... + geom_point(..., show.legend = FALSE)`

- [Scale axes](http://www.sthda.com/english/wiki/ggplot2-axis-scales-and-transformations) `... + scale_y_continuous(name="Stopping distance", limits=c(0, 150))`

- linetype options: `linetype = {"blank"|"solid"|"dashed"|"dotted"|"dotdash"|"longdash"|"twodash"}`

- add `geom_text` (label) with LaTeX formatting

    library(latex2exp)
    ... + geom_text(data, aes(x, y, label = TeX(colname, output='character')), parse = TRUE)

- [Color scales and palettes](http://www.sthda.com/english/wiki/ggplot2-colors-how-to-change-colors-automatically-and-manually)

    # with palette brewer:
    scale_color_brewer(palette="Set1")

    # with Wes Anderson themes:
    library(wesanderson)
    ... + scale_color_manual(values=wes_palette(n=3, name="GrandBudapest"))

    # with Grayscale:
    scale_color_grey(start=0.8, end=0.2)  # start and end are optional

    # with Gradients:
    scale_fill_gradient(low="blue", high="red")   # sequential gradient, 2 colors
    scale_color_gradient2(midpoint=mid, low="blue", mid="white", high="red", space ="Lab" )  # diverging gradient
    scale_color_gradientn(colours = rainbow(5)) # between n colors

- Axis number format with commas (not scientific notation)

    # without scientific notation: 
    scale_y_log10(labels = function(n){format(n, scientific = FALSE)})

    # with commas
    scale_y_log10(labels = scales::comma)
    scale_y_log10(labels = function(n){format(n, scientific = FALSE, big.mark = ",")})

    # just 10^x
    scale_y_log10(labels = scales::trans_format("log10", scales::math_format(10^.x)))

- [How to remove padding space on axis](https://stackoverflow.com/questions/22945651/how-to-remove-space-between-axis-area-plot-in-ggplot2): `scale_x_continuous(limits = ..., expand = expansion(mult = c(0,0)))`
- Theme font size changes `theme(axis.text.x = element_text(size = 12))`


## Useful Links

- Themes
    - [Complete themes --- ggtheme • ggplot2](https://ggplot2.tidyverse.org/reference/ggtheme.html)
    - [Modify components of a theme --- theme • ggplot2](https://ggplot2.tidyverse.org/reference/theme.html)
    - [ggplot2 themes and background colors : The 3 elements - Easy Guides - Wiki](http://www.sthda.com/english/wiki/ggplot2-themes-and-background-colors-the-3-elements)
- Facet Labels
    - Nested Facet Labels
        - [Nested facet plot with ggplot2](https://stackoverflow.com/questions/13651627/nested-facet-plot-with-ggplot2)
        - [ggh4x/facet_nested.R at master · teunbrand/ggh4x · GitHub](https://github.com/teunbrand/ggh4x/blob/master/R/facet_nested.R)
        - [Facets (ggplot2)](http://www.cookbook-r.com/Graphs/Facets_(ggplot2)/)
        - [ggplot2: have common facet bar in outer facet panel in 3-way plot](https://stackoverflow.com/questions/39801041/ggplot2-have-common-facet-bar-in-outer-facet-panel-in-3-way-plot)
        - [Nested facets in ggplot2 spanning groups](https://stackoverflow.com/questions/40316169/nested-facets-in-ggplot2-spanning-groups)
    - Removing Facet Labels
        - [Remove first part of a double label:](https://community.rstudio.com/t/ggplot-facet-wrap-edit-strip-labels/42636/3)
        - [Ggplot: How to remove axis labels on selected facets only?](https://community.rstudio.com/t/ggplot-how-to-remove-axis-labels-on-selected-facets-only/13191)
    - Labels documentation:
        - [labellers](https://ggplot2.tidyverse.org/reference/labellers.html)
        - [facet_grid](https://ggplot2.tidyverse.org/reference/facet_grid.html)
        - [labeller](https://ggplot2.tidyverse.org/reference/labeller.html)
        - [as_labeller](https://ggplot2.tidyverse.org/reference/as_labeller.html)
    - Label Bar Charts
        - [geomtext on facet dodged barplot](https://stackoverflow.com/questions/12888254/geom-text-labels-on-a-faceted-dodged-barplot)
        - [geom_text](https://ggplot2.tidyverse.org/reference/geom_text.html)
        - [geom_text](http://ggplot.yhathq.com/docs/geom_text.html)
        - [r gallery - add text tables](https://www.r-graph-gallery.com/275-add-text-labels-with-ggplot2.html)
        - [stackoverflow - specify geom text position by top/bottom/left/right](annotations:https://stackoverflow.com/questions/47916307/ggplot2-specify-geom-text-position-by-conventional-top-bottom-left-rig?rq=1)
- Add target line to chart: [How to add different lines for facets](https://stackoverflow.com/questions/11846295/how-to-add-different-lines-for-facets)
- Excel: [3 Ways to Add a Target Line to an Excel Pivot Chart](https://www.exceldashboardtemplates.com/3-ways-to-add-a-target-line-to-an-excel-pivot-chart/)
- Bars on Log Plots
    - geom_segment hack: [direction of bars in ggplot barplot with log scale axes](https://stackoverflow.com/questions/59311186/direction-of-bars-in-ggplot-barplot-with-log-scale-axes)
    - don't do it: [Graph Makeover: Bars on a log scale](https://community.jmp.com/t5/JMP-Blog/Graph-Makeover-Bars-on-a-log-scale/ba-p/30729)

## RStudio

- Show all panes: Ctrl + Alt + Shift + 0
