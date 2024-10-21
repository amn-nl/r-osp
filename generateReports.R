library(here)

#ource(here("common/helpers.R"))
#source(here("common/reportHelpers2024.R"))

scriptBaseFolder <- "bucuresti"
year <- 2024

create_folder_if_not_exists <- function(folderPath) {
  if (!dir.exists(folderPath)) {
    dir.create(folderPath, recursive = TRUE)
  }
}

mdx_to_pdf <- function(knitted, outputFile) {
  body <- readr::read_file(knitted)
  httr::POST(
    #url = "https://jeroenkpi.ahemen.nl/mdx?test=true",
    url = "http://localhost:3000/mdx?test=true",
    body = body,
    httr::write_disk(
      outputFile,
      overwrite = TRUE
    )
  )
  file.remove(knitted)
}

knit_mdx <- function(inputFile, inputParams = list()) {
  knitted <- rmarkdown::render(inputFile, params = inputParams, run_pandoc = FALSE)
  
  knitted <- paste(dirname(inputFile), "/", knitted, sep = "")
  outputFile <- paste(xfun::sans_ext(inputFile), ".pdf", sep = "")
  
  mdx_to_pdf(knitted, outputFile)
  
  outputFile
}

generate_mdx_document <- function(document, inputParams = list(), outputFolder = "OutputDocuments", outputPdfFile = NULL) {
  inputFile <- paste(here(scriptBaseFolder), "/", document, ".Rmd", sep = "")
  
  outputFile <- ifelse(!is.null(outputPdfFile),
                       paste(here(scriptBaseFolder), "/", outputFolder, "/", outputPdfFile, ".pdf", sep = ""),
                       paste(here(scriptBaseFolder), "/", outputFolder, "/", document, ".pdf", sep = "")
  )
  
  create_folder_if_not_exists(dirname(outputFile))
  
  tempFile <- knit_mdx(inputFile, inputParams)
  if (file.exists(tempFile) && file.exists(outputFile)) {
    file.remove(outputFile)
  }
  file.rename(tempFile, outputFile)
  
  print(paste("Created", outputFile))
}

generateOSPReports <- function() {
  
  reportAllParams <- list(
    Year = year
  )
  
  generate_mdx_document("report", reportAllParams, "OutputDocuments/Report", "Report1")
}

generateOSPReports()



