library(here)
library(dplyr)
library(tidyr)
library(openxlsx)

read_csv <- function(filePath, dec = ".") {
  fileData <- read.csv2(file = filePath, sep = ",", dec = dec, check.names = FALSE, stringsAsFactors = FALSE, encoding = "UTF-8")
  return(fileData)
}

# Generic function to convert a column into binary columns
create_binary_columns <- function(df, col) {
  if (is.numeric(df[[col]])) {
    # For numeric columns, create binary columns for unique values
    unique_vals <- sort(unique(df[[col]]))
    for (val in unique_vals) {
      df[[paste0(col, "_", val)]] <- ifelse(df[[col]] == val, 1, NA)
    }
    df <- df %>% select(-!!sym(col))  # Drop the original column after transformation
  } else if (is.character(df[[col]])) {
    # For comma-separated string columns, separate and pivot
    df_wide <- df %>%
      separate_rows(!!sym(col), sep = ", ") %>%
      mutate(!!sym(col) := as.numeric(!!sym(col))) %>%
      mutate(temp = 1) %>%
      pivot_wider(names_from = !!sym(col), values_from = temp, 
                  names_prefix = paste0(col, "_"), values_fill = NA) %>%
      group_by(studentIdentifier) %>%
      summarise(across(starts_with(paste0(col, "_")), ~ as.integer(any(. > 0))))
    
    df <- df_wide  # Replace original df with transformed df for character columns
  }
  return(df)
}

# Generic transformation function for the entire dataframe
transform_df <- function(df, cols_to_transform) {
  result_df <- df %>% select(studentIdentifier)  # Start with the 'studentIdentifier' column
  
  for (col in cols_to_transform) {
    transformed_col_df <- create_binary_columns(df, col)  # Transform each column
    
    # Merge result, but keep only binary columns (remove original columns)
    result_df <- left_join(result_df, transformed_col_df, by = "studentIdentifier")
  }
  
  # Remove original columns from cols_to_transform and columns with .x or .y suffix
  common_columns <- intersect(colnames(result_df), cols_to_transform)
  result_df <- result_df %>%
    select(-one_of(common_columns)) %>%                # Drop cols_to_transform columns
    select(-matches("\\.x$|\\.y$|\\_NA$"))                       # Drop columns with ".x" or ".y"
  
  return(result_df)
}

calculate_sums_for_factors <- function(df, factor_columns)
{
  q_columns <- select(df, factor_columns)
  s1_columns <- df %>% filter(q_19_1 == 1) %>% select(factor_columns)
  s2_columns <- df %>% filter(q_19_2 == 1) %>% select(factor_columns)
  s3_columns <- df %>% filter(q_19_3 == 1) %>% select(factor_columns)
  s4_columns <- df %>% filter(q_19_4 == 1) %>% select(factor_columns)
  s5_columns <- df %>% filter(q_19_5 == 1) %>% select(factor_columns)
  s6_columns <- df %>% filter(q_19_6 == 1) %>% select(factor_columns)
  return (
    c(sum(colSums(q_columns, na.rm = TRUE)),
      sum(colSums(s1_columns, na.rm = TRUE)),
      sum(colSums(s2_columns, na.rm = TRUE)),
      sum(colSums(s3_columns, na.rm = TRUE)),
      sum(colSums(s4_columns, na.rm = TRUE)),
      sum(colSums(s5_columns, na.rm = TRUE)),
      sum(colSums(s6_columns, na.rm = TRUE))
    ))
}
calculate_sums_for_question <- function(df, question_column, answers, question_label)
{
  q_columns <- df %>% select(starts_with(question_column))
  s1_columns <- df %>% filter(q_19_1 == 1) %>% select(starts_with(question_column))
  s2_columns <- df %>% filter(q_19_2 == 1) %>% select(starts_with(question_column))
  s3_columns <- df %>% filter(q_19_3 == 1) %>% select(starts_with(question_column))
  s4_columns <- df %>% filter(q_19_4 == 1) %>% select(starts_with(question_column))
  s5_columns <- df %>% filter(q_19_5 == 1) %>% select(starts_with(question_column))
  s6_columns <- df %>% filter(q_19_6 == 1) %>% select(starts_with(question_column))
  
  question_result  <- data.frame(
    "answers"<- answers,
    "total" <- colSums(q_columns, na.rm = TRUE),
    "s1" <- colSums(s1_columns, na.rm = TRUE),
    "s2" <- colSums(s2_columns, na.rm = TRUE),
    "s3" <- colSums(s3_columns, na.rm = TRUE),
    "s4" <- colSums(s4_columns,na.rm = TRUE),
    "s5" <- colSums(s5_columns,na.rm = TRUE),
    "s6" <- colSums(s6_columns,na.rm = TRUE)
  )
  
  colnames(question_result) <- c(question_label, "Total B", "Din S1", "Din S2", "Din S3", "Din S4", "Din S5", "Din S6")
  rownames(question_result)<- NULL
  return(question_result)
}

get_data_for_question <- function(df, metadatas, question_short, isq23 = FALSE)
{
  question_columns <- grep(paste0('^', question_short, '_'), all_metadata$friendly, value = TRUE)
  question_answers <- subset(all_metadata, friendly %in% question_columns)$label
  question_label <-  subset(all_metadata, friendly == question_short)$label
  if(isq23 == TRUE)
  {
    result <- calculate_sums_for_question(raport_data, paste0(question_short, '_'), question_columns, question_label)
  }
  else
  {
    result <- calculate_sums_for_question(raport_data, paste0(question_short, '_'), question_answers, question_label)
  }
  return(result)
}

add_question_sheet <- function(df, metadatas, wb, sheet_name, sheet_index, question_short)
{
  addWorksheet(wb, sheet_name, gridLines = TRUE)
  question_data <- get_data_for_question(df, metadatas, question_short, FALSE)
  writeData(wb, sheet = sheet_index, question_data, startRow = 1, rowNames = FALSE)
}

add_questions_2_3_sheet <- function(df, metadatas, wb, sheet_name, sheet_index, question_short)
{
  question_data <- get_data_for_question(raport_data, all_metadata, question_short, TRUE)
  question_combined_columns <- raport_data %>% select(starts_with(paste0(question_short, "_sum")))
  
  for(factor_sum in colnames(question_combined_columns))
  {
    #factor_sum_answer <- subset(all_metadata, friendly == factor_sum)$label
    factor_sum_parts <- unlist(regmatches(factor_sum, gregexpr("q_\\d+_(\\d+)", factor_sum)))
    
    # Extract only the numeric part and convert to numeric type
    factor_sum_limits <- as.numeric(sub("q_\\d+_", "", factor_sum_parts))
    factor_sum_columns <- paste(question_short, seq(factor_sum_limits[1], factor_sum_limits[2]), sep = "_")
    
    factor_sum_values <- calculate_sums_for_factors(raport_data, factor_sum_columns)
    
    index <- which(question_data[1] == factor_sum)
    question_data[index, 2:8] <- factor_sum_values
  }
  
  # add the question answers
  question_columns <- grep(paste0('^', question_short, '_'), all_metadata$friendly, value = TRUE)
  question_answers <- subset(all_metadata, friendly %in% question_columns)$label
  question_data[1] <- question_answers
  
  addWorksheet(wb, sheet_name, gridLines = TRUE)
  writeData(wb, sheet = sheet_index, question_data, startRow = 1, rowNames = FALSE)
}


scriptBaseFolder <- "bucuresti"

input <- read.csv(paste0(here(scriptBaseFolder), "/source/XmlResultOsp.csv"), sep = ",")
questions_metadata <- read.csv(paste0(here(scriptBaseFolder), "/source/osp-bucharest.csv"), sep = ",")
personal_info_metadata <- read.csv(paste0(here(scriptBaseFolder), "/source/personal_info_metadata.csv"), sep = ",")

all_metadata <- rbind(personal_info_metadata, questions_metadata)

data_structure_columns <- grep("^q", colnames(input), value = TRUE)
valid_columns <-c('studentIdentifier',
                  'sessionIdentifier',
                  'participant.firstName',
                  'participant.lastName',
                  'participant.sortName',
                  data_structure_columns
)

input <- input %>% select(valid_columns)

# Transform the dataframe and remove the original columns
df_transform <- transform_df(input, data_structure_columns)

# get all columns from metadata
all_columns <- all_metadata$friendly

# add columns without result and sort them using the order of "all_columns"
columns_without_result <- setdiff(all_columns, colnames(df_transform))
for(column in columns_without_result)
  df_transform[column] <- NA

raport_data <-  df_transform %>% select(all_of(all_columns))


wb <- createWorkbook("Woorkbook")
# Sheet Raport
addWorksheet(wb, "Raport", gridLines = TRUE)
raport_data_sheet1 <- raport_data
colnames(raport_data_sheet1) <- all_metadata$label
writeData(wb, sheet = 1, raport_data, startRow = 3, rowNames = FALSE)

# Sheet Intrebarea 1
sheetIndex <- 2
add_question_sheet(raport_data, all_metadata, wb, "Î1", sheetIndex, "q_1")
sheetIndex <- sheetIndex + 1

# Sheet Intrebarea 2
add_questions_2_3_sheet(raport_data, all_metadata, wb, "Î2", sheetIndex, "q_2")
sheetIndex <- sheetIndex + 1

# Sheet Intrebarea 3
add_questions_2_3_sheet(raport_data, all_metadata, wb, "Î3", sheetIndex, "q_3")
sheetIndex <- sheetIndex + 1

#Sheets for Intrebarea 4 - Intrebarea 20
for (question_index in seq(4, 20))
{
  if(question_index == 15)
  {
    add_question_sheet(raport_data, all_metadata, wb, "Î15 - A", sheetIndex, "q_15_a")
    sheetIndex <- sheetIndex + 1
    add_question_sheet(raport_data, all_metadata, wb, "Î15 - B", sheetIndex, "q_15_b")
    sheetIndex <- sheetIndex + 1
  }
  else
  {
    add_question_sheet(raport_data, all_metadata, wb, paste0('Î', question_index), sheetIndex, paste0('q_', question_index))
    sheetIndex <- sheetIndex + 1
  }
}


saveWorkbook(wb, paste0(here(scriptBaseFolder), "/source/result.xlsx"), overwrite = TRUE)
