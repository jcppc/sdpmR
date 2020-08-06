# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#spots_version <- function() {
#  print("Hello, from SPOTS v.1.0.0")
#}


spot_fingerprints <- function( input,
                               case_id = "case",
                               activity_id = "event",
                               timestamp = "completeTime",
                               output = ".",
                               export_variants = TRUE,
                               export_metrics = TRUE,
                               graph_direction = "TB",
                               graph_palette = "Greens",
                               node_threshold = 0,
                               edge_threshold = 0.3,
                               edge_correlation_ratio = 0.75 ) {

  # Load the sample dataset
  library(fuzzymineR)
  #data("artificial_loan_process")
  #input <- artificial_loan_process; graph_direction <- "TB"; graph_palette <- "Greens"
  #elog <- readr::read_delim( "/Users/joaocaldeira/Desktop/Manual.csv", ";" )

  #input <- elog[,c("team","commandName","timestamp_begin","timestamp_end")]

  # Create an eventlog object
  log <- fuzzymineR::create_eventlog( as.data.frame( input ),
                         case_id = case_id,
                         activity_id = activity_id,
                         timestamp = timestamp)

  # Mine the fuzzy model
  metrics <- fuzzymineR::mine_fuzzy_model( log )

  # Visualize the fuzzy model for a given set of
  # parameters

  model <- viz_fuzzy_model2(metrics = metrics,
                  node_sig_threshold = node_threshold,
                  edge_sig_threshold = edge_threshold,
                  edge_sig_to_corr_ratio = edge_correlation_ratio, graph_layout = graph_direction, graph_palette = graph_palette)

  if ( export_variants ) DiagrammeRsvg::export_svg( model ) %>% charToRaw %>% rsvg::rsvg_pdf( paste0( output, "/VariantModel.pdf" ))
  if ( export_metrics ) writeTable( metrics, output);

  return ( metrics );

}


