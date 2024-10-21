library(here)

read_csv <- function(filePath, dec = ".") {
  fileData <- read.csv2(file = filePath, sep = ",", dec = dec, check.names = FALSE, stringsAsFactors = FALSE, encoding = "UTF-8")
  return(fileData)
}

scriptBaseFolder <- "bucuresti"

input <- read.csv(paste0(here(scriptBaseFolder), "/source/XmlResultOsp.csv"), sep = ",")

colnames(input)

