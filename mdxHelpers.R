library(knitr)
library(jsonlite)

stackedBarChart <- function(
  label,
  values = NULL,
  percentages = NULL,
  colors = NULL
) {
  paste0("<StackedBarChart label={`", label, "`}
    ", ifelse(!is.null(values), paste0("values={", jsonlite::toJSON(values), "}"), ""), "
    ", ifelse(!is.null(percentages), paste0("percentages={", jsonlite::toJSON(percentages), "}"), ""), "
    ", ifelse(!is.null(colors), paste0("colors={", jsonlite::toJSON(colors), "}"), ""), "
  />
", sep = "")
}

donutChart <- function(
  values = NULL,
  percentages = NULL,
  radius = 16.5,
  colors = NULL,
  threshold = 0
) {
  paste("<DonutChart
    ", ifelse(!is.null(values), paste("values={", jsonlite::toJSON(values), "}"), ""), "
    ", ifelse(!is.null(percentages), paste("percentages={", jsonlite::toJSON(percentages), "}"), ""), "
    ", ifelse(!is.null(colors), paste("colors={", jsonlite::toJSON(colors), "}"), ""), "
    radius={", format(radius, decimal.mark=".") ,"}
    threshold={", format(threshold, decimal.mark=".") ,"}
  />
", sep = "")
}

graphAverage <- function(
  label,
  scores,
  intervals = c(301, 305, 333, 375, 434, 469, 500),
  showLegend = FALSE
) {
  average = fix_rounding(mean(scores), 1)
  averageDisplay <- ifelse(average %% 1 == 0, paste0(as.character(average), ",0"), as.character(average))
  paste("<GraphAverage
  	min={", min(intervals), "}
  	max={", max(intervals), "}
  	scoreMin={", min(scores), "}
  	scoreAverage={", format(average, decimal.mark=".", digits=4), "}
  	scoreAverageDisplay=\"", averageDisplay, "\"
  	scoreMax={", max(scores), "}
  	intervals={", jsonlite::toJSON(intervals), "}
  	scores={", jsonlite::toJSON(scores), "}
  	label={`", label, "`}", ifelse(showLegend, "
  	legend={['pro / vmbo-bb', 'vmbo-bb / kb', 'vmbo-kb / gt', 'vmbo-gt / havo', 'havo / vwo', 'vwo', null]}
  	showLegend", ""), "
  />
", sep = "")
}

graphAverageSubdomains <- function(
    theta_details = NULL,
    results = NULL,
    factor = NULL,
    label = NULL,
    debugData = NULL
) {
  minValue <- theta_details['min', factor]
  maxValue <- theta_details['max', factor]
  averageBO <- theta_details['mean_bo', factor]
  averageSBO <- theta_details['mean_sbo', factor]
  scores <- na.omit(results[,factor])
  averageScore <- mean(scores, na.rm = TRUE)
  
  if(averageScore < minValue){
    stop(paste0("averageScore < minScore; average:", averageScore , " min: ", minValue, " label: ", label, " location and group:", debugData))
    averageScore <- minValue
  }
 
  if(averageScore > maxValue){
    stop(paste0("averageScore > maxScore; average:", averageScore , " max: ", maxValue, " label: ", label, " location and group:", debugData))
    averageScore <- maxValue
  }
  
  normalizedScores <- scores
  normalizedScores[normalizedScores < minValue] <- minValue
  normalizedScores[normalizedScores > maxValue] <- maxValue
  interval <- c(minValue, maxValue)
  
  paste("<GraphAverage
  	min={", minValue, "}
  	max={", maxValue, "}
  	scoreMin={", averageScore, "}
  	scoreMinDisplay=\"\"
  	scoreAverage={", averageBO, "}
  	scoreAverageDisplay=\"\"
  	scoreMax={", averageSBO, "}
  	scoreMaxDisplay=\"\"
  	intervals={", jsonlite::toJSON(interval), "}
  	scores={", jsonlite::toJSON(normalizedScores), "}
  	indicator=\"true\"
  	showIntervals={false}
  	smallHeight = \"true\"
  	label={`", label, "`}",
  "/>", sep = "")
}

map <- function(dataframe, fun) {
  lapply(1:nrow(dataframe), function(i, arr) { fun(arr[i, ], i = i, last = ifelse(i == nrow(arr), TRUE, FALSE)) }, dataframe)
}

table <- function(dataframe, footers = NULL, classNames = c(), pillColors = c()) {
  paste("<Table
  ", ifelse(!is.null(footers), paste("footers={", jsonlite::toJSON(footers), "}"), ""), "
    headers={", jsonlite::toJSON(colnames(dataframe)) ,"}
    data={", jsonlite::toJSON(dataframe, pretty = TRUE, dataframe = "values"), "}
    classNames={", jsonlite::toJSON(classNames) ,"}
    pillColors={", jsonlite::toJSON(pillColors) ,"}
  />", sep = "")
  #paste("<Table data={", toJSON(rbind(colnames(dataframe), as.matrix(dataframe))), "} />", sep = "")
}

graph100 <- function(
    title,
    score = NULL,
    scoreDisplay = NULL
) {
  paste0("<GraphRow100
   title=\"", title, "\"
   score={", score, "}
   scoreDisplay={", scoreDisplay, "}
   showPercentageSign={false}
   border={false}
   innerPadding='pt-2'
   fontWeight=\"font-normal\"
   textSize=\"text-2xs\"
  />
", sep = "")
}


outputRawHtml <- function(s) {
  res = paste(s, sep = "\n")
  #knitr::raw_html(res)
  knitr::raw_output(res, c("", ""))
}

#library(httr)
#library(readr)
#library(rmarkdown)
#mdx_document <- function(inputFile, encoding) {
#  print(inputFile);
#  knitted <- rmarkdown::render(inputFile, encoding=encoding, run_pandoc = FALSE);
#  print(paste("hi ->", knitted));
#  body <- readr::read_file(knitted);
#  httr::POST(url = "http://localhost:3000/mdx?test=true", body = body, httr::write_disk("sample.pdf", overwrite = TRUE));
#  print("done")
#}
