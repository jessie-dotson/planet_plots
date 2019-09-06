# definitions and functions for custom palettes
# this is basically from this blog post
# https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2
# with some adjustments for my own colors


#####################################################
## flat ui colors and functions ##
# colors from https://flatuicolors.com/palette/defo
geert_colors <- c(
  `turquoise`  = "#1abc9c",
  `green_sea`  = "#16a085",
  `emerald`    = "#2ecc71",
  `nephritis`  = "#27ae60",
  `peter_river`= "#3498db",
  `belize_hole`= "#2980b9",
  `amethyst`   = "#9b59b6",
  `wisteria`   = "#8e44ad",
  `wet_asphalt` = "#34495e",
  `midnight_blue` = "#2c3e50",
  `concrete`   = "#95a5a6",
  `asbestos`   = "#7f8c8d",
  `clouds`     = "#ecf0f1",
  `silver`     = "#bdc3c7",
  `sunflower`  = "#f1c40f",
  `orange`     = "#f39c12",
  `carrot`     = "#e67e22",
  `pumpkin`    = "#d35400",
  `alizarin`   = "#e74c3c",
  `pomegranate` = "#c0392b")

#' Function to extract drsimonj colors as hex codes
#'
#' @param ... Character names of geert_colors 
#'
geert_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (geert_colors)
  
  geert_colors[cols]
}

# combine colors into palettes
geert_palettes <- list(
  `main_light`  = geert_cols("peter_river", "amethyst", "emerald"),
  
  `main` = geert_cols("belize_hole","wisteria","orange"),
  
  `cool_light`  = geert_cols("turquoise", "emerald","peter_river"),
  
  `cool` = geert_cols("green_sea","nephritis","belize_hole"),
  
  `hot_light`   = geert_cols("sunflower", "carrot", "alizarin"),
  
  `hot` = geert_cols("orange","pumpkin","pomegranate"),
  
  `mixed_light` = geert_cols("emerald", "peter_river", "amethyst", "alizarin", "carrot", "sunflower"),
  
  `mixed` = geert_cols("nephritis","belize_hole","wisteria","orange","pumpkin","pomegranate"),
  
  `grey`  = geert_cols("clouds", "silver", "concrete","asbestos","wet_asphalt","midnight_blue"),
  
  `planets` = geert_cols("emerald","green_sea","peter_river","pomegranate","amethyst"),
  
  `planets2` = geert_cols("emerald","sunflower","peter_river","pomegranate","amethyst")
)

#' Return function to interpolate a drsimonj color palette
#'
#' @param palette Character name of palette in geert_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
geert_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- geert_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

#' Color scale constructor for geert colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_geert <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- geert_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("geert_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for geert colors
#'
#' @param palette Character name of palette in geert_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_geert <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- geert_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("geert_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}





#####################################################
## original drsimonj colors and functions ##
drsimonj_colors <- c(
  `red`        = "#d11141",
  `green`      = "#00b159",
  `blue`       = "#00aedb",
  `orange`     = "#f37735",
  `yellow`     = "#ffc425",
  `light grey` = "#cccccc",
  `dark grey`  = "#8c8c8c")

#' Function to extract drsimonj colors as hex codes
#'
#' @param ... Character names of drsimonj_colors 
#'
drsimonj_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (drsimonj_colors)
  
  drsimonj_colors[cols]
}

# combine colors into palettes
drsimonj_palettes <- list(
  `main`  = drsimonj_cols("blue", "green", "yellow"),
  
  `cool`  = drsimonj_cols("blue", "green"),
  
  `hot`   = drsimonj_cols("yellow", "orange", "red"),
  
  `mixed` = drsimonj_cols("blue", "green", "yellow", "orange", "red"),
  
  `grey`  = drsimonj_cols("light grey", "dark grey")
)

#' Return function to interpolate a drsimonj color palette
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
drsimonj_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- drsimonj_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

#' Color scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_drsimonj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- drsimonj_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("drsimonj_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_drsimonj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- drsimonj_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("drsimonj_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}





