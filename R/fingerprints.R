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

spots_version <- function() {
  print("Hello, from SPOTS v.1.0.0")
}


spot_fingerprints <- function( input,
                               case_id = "case",
                               activity_id = "event",
                               timestamp = "completeTime",
                               output = ".",
                               graph_direction = "TB",
                               graph_palette = "Greens" ) {

 library(fuzzymineR)
 source('viz_fuzzy_model2.R')

  # Load the sample dataset
  data("artificial_loan_process")

  # Create an eventlog object
  log <- fuzzymineR::create_eventlog( input ,
                         case_id = "case",
                         activity_id = "event",
                         timestamp = "completeTime")

  # Mine the fuzzy model
  metrics <- fuzzymineR::mine_fuzzy_model( log )

  # Visualize the fuzzy model for a given set of
  # parameters

  model <- viz_fuzzy_model2(metrics = metrics,
                  node_sig_threshold = 0,
                  edge_sig_threshold = 0.3,
                  edge_sig_to_corr_ratio = 0.75, graph_layout = graph_direction, graph_palette = graph_palette)

  DiagrammeRsvg::export_svg( model ) %>% charToRaw %>% rsvg::rsvg_pdf( paste0( output, "/VariantModel.pdf" ))

  return ("Model Done.");

}

