# -----------------------------------------------------------------------------
# clear the console area
cat("\014")
# clear the environment var area
rm(list = ls())
# clear all plots
graphics.off()
# -----------------------------------------------------------------------------
# current_directory
current_directory <- getwd()
# read_csv
# joint file path
file_path <- file.path(current_directory, "combined_features.csv")
data <- read.csv(file_path)
# show data
head(data)
# -----------------------------------------------------------------------------
# Check for missing values
sum(is.na(data))
# -----------------------------------------------------------------------------
