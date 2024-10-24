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
    result <- calculate_sums_for_question(report_data, paste0(question_short, '_'), question_columns, question_label)
  }
  else
  {
    result <- calculate_sums_for_question(report_data, paste0(question_short, '_'), question_answers, question_label)
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
  question_data <- get_data_for_question(report_data, all_metadata, question_short, TRUE)
  question_combined_columns <- report_data %>% select(starts_with(paste0(question_short, "_sum")))
  
  for(factor_sum in colnames(question_combined_columns))
  {
    #factor_sum_answer <- subset(all_metadata, friendly == factor_sum)$label
    factor_sum_parts <- unlist(regmatches(factor_sum, gregexpr("q_\\d+_(\\d+)", factor_sum)))
    
    # Extract only the numeric part and convert to numeric type
    factor_sum_limits <- as.numeric(sub("q_\\d+_", "", factor_sum_parts))
    factor_sum_columns <- paste(question_short, seq(factor_sum_limits[1], factor_sum_limits[2]), sep = "_")
    
    factor_sum_values <- calculate_sums_for_factors(report_data, factor_sum_columns)
    
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

calculate_q2_q3_combination <- function(df, columns, result_column_names)
{
  q2_columns <- columns[startsWith(columns, "q_2_")]
  q3_columns <- columns[startsWith(columns, "q_3_")]
  
  combinations <- expand.grid(q2 = q2_columns, q3 = q3_columns)
  
  #For each combination, calculate the sum of rows where both q2 and q3 are 1
  sum_values <- apply(combinations, 1, function(combo) {
    sum(df[[combo[1]]] == 1 & df[[combo[2]]] == 1, na.rm = TRUE)
  })
  
  combinations_result <- data.frame(
    q2_column = combinations$q2,
    q3_column = combinations$q3,
    sums = sum_values
  )
  
  result <- data.frame(combinations = character(), sums = numeric(), stringsAsFactors = FALSE)
  
  # Get unique q3 values
  unique_q3 <- unique(combinations_result$q3_column)
  
  # Loop through each unique q3 value
  for (q3 in unique_q3) {
    # Get the corresponding q2 values for this q3 value
    q2_values <- combinations_result$q2_column[combinations_result$q3_column == q3]
    
    # Sum values where q3 matches
    sum_values <- sum(combinations_result$sums[combinations_result$q3_column == q3])
    
    # Add the q3 entry to the result
    result <- rbind(result, data.frame(combinations = q3, sums = sum_values, stringsAsFactors = FALSE))
    
    # For each corresponding q2 value, append it to the result
    for (q2 in q2_values) {
      # Get the value for this q2 entry
      value_for_q2 <- combinations_result$sums[combinations_result$q2_column == q2 & combinations_result$q3_column == q3]
      
      # Add the q2 entry to the result
      result <- rbind(result, data.frame(combinations = q2, sums = value_for_q2, stringsAsFactors = FALSE))
    }
  }
  colnames(result)<- result_column_names
  return(result)
}

add_q2_q3_combination_sheet <- function(df, metadatas, wb, sheet_name, sheet_index, question_short)
{
  total_result <- calculate_q2_q3_combination(df, columns_with_result, c("friendly", "total"))
  s1_result <- calculate_q2_q3_combination(df %>% filter(q_19_1 == 1), columns_with_result, c("friendly", "s1"))
  s2_result <- calculate_q2_q3_combination(df %>% filter(q_19_2 == 1), columns_with_result, c("friendly", "s2"))
  s3_result <- calculate_q2_q3_combination(df %>% filter(q_19_3 == 1), columns_with_result, c("friendly", "s3"))
  s4_result <- calculate_q2_q3_combination(df %>% filter(q_19_4 == 1), columns_with_result, c("friendly", "s4"))
  s5_result <- calculate_q2_q3_combination(df %>% filter(q_19_5 == 1), columns_with_result, c("friendly", "s5"))
  s6_result <- calculate_q2_q3_combination(df %>% filter(q_19_6 == 1), columns_with_result, c("friendly", "s6"))
  
  
  total_result$s1 <- s1_result$s1
  total_result$s2 <- s2_result$s2
  total_result$s3 <- s3_result$s3
  total_result$s4 <- s4_result$s4
  total_result$s5 <- s5_result$s5
  total_result$s6 <- s6_result$s6
  total_result <- total_result[total_result$total > 0, ]
  
  # rename the friendly column with labels
  total_result <- total_result %>%
    left_join(metadatas, by = "friendly") %>%
    select(label, total, s1, s2, s3, s4, s5, s6) %>%
    rename(friendly = label)
  
  question_label <-  subset(metadatas, friendly == question_short)$label
  colnames(total_result) <- c(question_label, "Total B", "Din S1", "Din S2", "Din S3", "Din S4", "Din S5", "Din S6")
  addWorksheet(wb, sheet_name, gridLines = TRUE)
  writeData(wb, sheet = sheet_index, total_result, startRow = 1, rowNames = FALSE)
}

count_occurrences <- function(input_vector, input_data) {
  # Filter the input data for rows where the number is in the input vector
  filtered_data <- input_data %>%
    filter(participant.school %in% input_vector)
  
  # Count occurrences of each number
  result <- filtered_data %>%
    group_by(participant.school) %>%
    summarise(occurrences = n())
  
  # Return the result
  return(result)
}

add_schools_sheet <- function(df, schools, wb, sheet_name, sheet_index)
{
  schools_names <- schools$school_name
  
  schools_data_all <- count_occurrences(schools_names, df)
  schools_data_tested <- count_occurrences(schools_names, df %>% filter(`participant.testStatus` == "Testat"))
  
  schools_data_with_results <- left_join(schools_data_all, schools_data_tested, by ="participant.school")
  colnames(schools_data_with_results) <- c('school_name', 'total', 'tested')
  
  total_count <- colSums(schools_data_with_results %>% select('total', 'tested'), na.rm = TRUE)
  
  schools_data <- schools_data_with_results #left_join(schools, schools_data_with_results, by ='school_name')
  
  schools <- schools %>% select("sector", "school_name")
  schools_data <- left_join(schools, schools_data_with_results, by ="school_name")
  schools_data[is.na(schools_data)] <- 0
  
  colnames(schools_data) <- c('Sectorul', 'Școala',	'Elevi participanți',	'Elevi participanți care au răspuns la chestionar')
  
  addWorksheet(wb, sheet_name, gridLines = TRUE)
  writeData(wb, sheet = sheet_index, total_count[1], startRow = 1, startCol = 3)
  writeData(wb, sheet = sheet_index, total_count[2], startRow = 1, startCol = 4)
  writeData(wb, sheet = sheet_index, schools_data, startRow = 2, rowNames = FALSE)
}

calculate_counts <- function(df)
{
    counts <- c(
      nrow(report_data),
      nrow(report_data %>% filter(`participant.testStatus` == "Testat")),
      nrow(report_data %>% filter(`participant.testStatus` == "În testare (50%)")),
      nrow(report_data %>% filter(`participant.testStatus` == "În sesiune")),
      nrow(report_data %>% filter(q_1_1 == 1)),
      nrow(report_data %>% filter(q_1_2 == 1))
    )
  return(counts)
}

add_counts_sheet <- function(df, wb, sheet_name, sheet_index)
{
  counts_df <- data.frame (
    label = c('total', 'tested', 'testing', 'insessie', 'continue', 'stop'),
    total_counts = calculate_counts(df),
    s1_counts = calculate_counts(df %>% filter(q_19_1 == 1)),
    s2_counts = calculate_counts(df %>% filter(q_19_2 == 1)),
    s3_counts = calculate_counts(df %>% filter(q_19_3 == 1)),
    s4_counts = calculate_counts(df %>% filter(q_19_4 == 1)),
    s5_counts = calculate_counts(df %>% filter(q_19_5 == 1)),
    s6_counts = calculate_counts(df %>% filter(q_19_6 == 1))
  )
  counts_df$label <- c(
    'Numărul total al elevilor de clasa a VIII-a participanți',
    'Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar',
    'Numărul total al elevilor de clasa a VIII-a participanți care au început, dar nu au finalizat completarea chestionarului',
    'Numărul total al elevilor de clasa a VIII-a participanți care nu au răspuns la chestionar',
    'Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar și doresc să continue studiile după terminarea clasei a VIII-a',
    'Numărul total al elevilor de clasa a VIII-a participanți care au răspuns la chestionar, dar nu doresc să continue studiile după terminarea clasei a VIII-a'
    
  )
  colnames(counts_df) <- c("Participarea la „Chestionarul privind opțiunile școlare și profesionale ale elevilor de clasa a VIII-a”",
                           "Total B", "Din S1", "Din S2", "Din S3", "Din S4", "Din S5", "Din S6")
  
  addWorksheet(wb, sheet_name, gridLines = TRUE)
  writeData(wb, sheet = sheet_index, counts_df, startRow = 1, rowNames = FALSE)
}





scriptBaseFolder <- "bucuresti"

#load results and personal info
input_results <- read.csv(paste0(here(scriptBaseFolder), "/source/XmlResult_bucharest_short.csv"), sep = ",")
input_personal_info <- read.csv(paste0(here(scriptBaseFolder), "/source/personal_info_bucharest_short.csv"), sep = ",")

#laod metadatas
questions_metadata <- read.csv(paste0(here(scriptBaseFolder), "/source/osp-bucharest.csv"), sep = ",")
personal_info_metadata <- read.csv(paste0(here(scriptBaseFolder), "/source/personal_info_metadata.csv"), sep = ",")
all_metadata <- rbind(personal_info_metadata, questions_metadata)

schools_metadata <- read.csv(paste0(here(scriptBaseFolder), "/source/bucharest_schools.csv"), sep = ",")

data_structure_columns <- grep("^q", colnames(input_results), value = TRUE)
valid_columns <-c('studentIdentifier',
                  'sessionIdentifier',
                  #'participant.firstName',
                  #'participant.lastName',
                  #'participant.sortName',
                  data_structure_columns
)

input_results <- input_results %>% select(valid_columns)

input_data <- left_join(input_personal_info, input_results, by=c("studentIdentifier", "sessionIdentifier"))

# Transform the dataframe and remove the original columns
df_transform <- transform_df(input_data, data_structure_columns)

# get all columns from metadata
all_columns <- all_metadata$friendly

# add columns without result and sort them using the order of "all_columns"
columns_without_result <- setdiff(all_columns, colnames(df_transform))
# keep the name of the columns that have results
columns_with_result <- colnames(df_transform)
columns_with_result <- columns_with_result[startsWith(columns_with_result, "q_")]
                   
for(column in columns_without_result)
  df_transform[column] <- NA

report_data <-  df_transform %>% select(all_of(all_columns))


wb <- createWorkbook("Woorkbook")
# Sheet Raport
addWorksheet(wb, "Raport", gridLines = TRUE)
report_data_sheet1 <- report_data
colnames(report_data_sheet1) <- all_metadata$label
writeData(wb, sheet = 1, report_data_sheet1, startRow = 3, rowNames = FALSE)

sheetIndex <- 2

# Sheet Școli participante
add_schools_sheet(report_data, schools_metadata, wb, "Școli participante", sheetIndex)
sheetIndex <- sheetIndex + 1

# Sheet Participare 
add_counts_sheet(report_data, wb, "Participare", sheetIndex)
sheetIndex <- sheetIndex + 1

# Sheet Intrebarea 1
add_question_sheet(report_data, all_metadata, wb, "Î1", sheetIndex, "q_1")
sheetIndex <- sheetIndex + 1

# Sheet Intrebarea 2
add_questions_2_3_sheet(report_data, all_metadata, wb, "Î2", sheetIndex, "q_2")
sheetIndex <- sheetIndex + 1

# Sheet Intrebarea 3
add_questions_2_3_sheet(report_data, all_metadata, wb, "Î3", sheetIndex, "q_3")
sheetIndex <- sheetIndex + 1

add_q2_q3_combination_sheet(report_data, all_metadata, wb, "Licee și specializări", sheetIndex, "q_3")
sheetIndex <- sheetIndex + 1

#Sheets for Intrebarea 4 - Intrebarea 20
for (question_index in seq(4, 20))
{
  if(question_index == 15)
  {
    add_question_sheet(report_data, all_metadata, wb, "Î15 - A", sheetIndex, "q_15_a")
    sheetIndex <- sheetIndex + 1
    add_question_sheet(report_data, all_metadata, wb, "Î15 - B", sheetIndex, "q_15_b")
    sheetIndex <- sheetIndex + 1
  }
  else
  {
    add_question_sheet(report_data, all_metadata, wb, paste0('Î', question_index), sheetIndex, paste0('q_', question_index))
    sheetIndex <- sheetIndex + 1
  }
}

saveWorkbook(wb, paste0(here(scriptBaseFolder), "/source/result_short.xlsx"), overwrite = TRUE)
