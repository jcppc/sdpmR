\name{spot_fingerprints}
\alias{spot_fingerprints}
\title{Hello, World!}
\usage{
spot_fingerprints( input,
                   case_id = "case",
                   activity_id = "event",
                   timestamp = "completeTime",
                   output = ".",
                   graph_direction = "TB",
                   graph_palette = "Greens" )
}
\description{
Prints Hello, from SPOTS v.1.0.0"
}
\examples{
library(fuzzymineR)

# Load the sample dataset
data("artificial_loan_process")
log <- as.data.frame( artificial_loan_process )
spot_fingerprints( input = log,
                   case_id = "case",
                   activity_id = "event",
                   timestamp = "completeTime",
                   output = ".",
                   graph_direction = "TB",
                   graph_palette = "Greens" )
}
