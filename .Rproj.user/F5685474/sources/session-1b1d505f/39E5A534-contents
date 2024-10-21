
n <- 30

# Create the data frame
df <- data.frame(
  student_id = paste0("Student_", 1:n),
  q1 = sample(1:2, n, replace = TRUE),
  q2 = sample(1:182, n, replace = TRUE),
  q3 = sample(1:126, n, replace = TRUE),
  q4 = sample(1:13, n, replace = TRUE),
  q5 = sample(1:7, n, replace = TRUE),
  q6 = sample(1:5, n, replace = TRUE),
  q7 = sample(1:5, n, replace = TRUE),
  q8 = sample(1:27, n, replace = TRUE),
  q9 = sample(1:16, n, replace = TRUE),
  q10 = sample(1:14, n, replace = TRUE),
  q11 = sample(1:6, n, replace = TRUE),
  q12 = sample(1:6, n, replace = TRUE),
  q13 = sample(1:6, n, replace = TRUE),
  q14 = sample(1:6, n, replace = TRUE),
  q15 = sample(1:5, n, replace = TRUE),
  q16 = sample(1:5, n, replace = TRUE),
  q17 = sample(1:3, n, replace = TRUE),
  q18 = sample(1:10, n, replace = TRUE),
  q19 = sample(1:7, n, replace = TRUE),
  q20 = sample(1:6, n, replace = TRUE),
  q21 = sample(1:2, n, replace = TRUE)
)

# Print the data frame
#print(df)



# Load necessary libraries
library(dplyr)
library(tidyr)

# Sample data frame with multiple columns (each containing categorical values)
set.seed(123)
df <- data.frame(
  id = 1:50,                      # Identifier column
  q1 = sample(1:150, 50, replace = TRUE),  # First categorical column
  q2 = sample(1:50, 50, replace = TRUE)    # Second categorical column
)

# Create a one-hot encoded data frame ensuring all 150 values for category_1 and 50 for category_2 are included
df_transformed <- df %>%
  pivot_longer(cols = starts_with("q"),    # Transform category_1 and category_2 into long format
               names_to = "category_type",       # Create a column for the original column names
               values_to = "category_value") %>%
  mutate(value = 1) %>%                          # Add a column with value 1 for one-hot encoding
  pivot_wider(names_from = c(category_type, category_value),  # Spread categories into wide format
              values_from = value, 
              values_fill = 0,                   # Fill missing values with 0
              names_prefix = "") %>%
  # Ensure that all columns from category_1 (1 to 150) and category_2 (1 to 50) are present
  #complete(id, nesting(category_1 = 1:150, category_2 = 1:50), fill = list(value = 0)) #%>%
  # Optionally order columns: First category_1 columns and then category_2 columns
 select(id, starts_with("q1"), starts_with("q2"))

# 
# df_transformed2 <- df %>%
#   pivot_longer(cols = starts_with("category"),    # Convert category_1 and category_2 to long format
#                names_to = "category_type",       # Temporary column to hold the original column names
#                values_to = "category_value") %>%
#   mutate(value = 1) %>%                          # Create a new column with the value '1' for one-hot encoding
#   pivot_wider(names_from = c(category_type, category_value), 
#               values_from = value, 
#               values_fill = 0,                   # Fill missing values with 0
#               names_prefix = "") %>%
#   # Add missing columns for all 150 values of category_1 and all 50 values of category_2
#   bind_cols(as_tibble(matrix(0, nrow = nrow(df), ncol = 150 - length(grep("^category_1_", names(.))))), 
#             as_tibble(matrix(0, nrow = nrow(df), ncol = 50 - length(grep("^category_2_", names(.)))))) %>%
#   # Rename the added columns to match missing category_1 and category_2 values
#   rename_with(~paste0("category_1_", setdiff(1:150, unique(df$category_1))), starts_with("V1")) %>%
#   rename_with(~paste0("category_2_", setdiff(1:50, unique(df$category_2))), starts_with("V2")) %>%
#   # Ensure the columns are in the correct order (first category_1, then category_2)
#   select(id, starts_with("category_1_"), starts_with("category_2_"))

# Print the transformed data frame
# print(df_transformed)



# Load necessary libraries
# library(dplyr)
# library(tidyr)
# 
# # Sample data frame with multiple columns (each containing categorical values)
# set.seed(123)
# df <- data.frame(
#   id = 1:10,                      # Identifier column
#   category_1 = sample(1:150, 10, replace = TRUE),  # First categorical column (1 to 150)
#   category_2 = sample(1:50, 10, replace = TRUE)    # Second categorical column (1 to 50)
# )
# 
# # Manually create all possible combinations for category_1 (1 to 150) and category_2 (1 to 50)
# all_category_1 <- as.character(1:150)  # Create a sequence of all possible values for category_1
# all_category_2 <- as.character(1:50)   # Create a sequence of all possible values for category_2
# 
# # Transform the data into one-hot encoding for all possible values in category_1 and category_2
# df_transformed <- df %>%
#   pivot_longer(cols = starts_with("category"),    # Transform category_1 and category_2 into long format
#                names_to = "category_type",       # Create a column for the original column names
#                values_to = "category_value") %>%
#   mutate(value = 1) %>%                          # Add a column with value 1 for one-hot encoding
#   pivot_wider(names_from = c(category_type, category_value), 
#               values_from = value, 
#               values_fill = 0,                   # Fill missing values with 0
#               names_prefix = "") %>%
#   # Create empty columns for all missing category_1 (1 to 150) and category_2 (1 to 50) combinations
#   bind_cols(as_tibble(matrix(0, nrow = nrow(df), ncol = 150 - length(grep("^category_1_", names(.))))), 
#             as_tibble(matrix(0, nrow = nrow(df), ncol = 50 - length(grep("^category_2_", names(.)))))) %>%
#   # Rename missing columns for category_1 and category_2
#   rename_with(~paste0("category_1_", setdiff(1:150, unique(df$category_1))), starts_with("V1")) %>%
#   rename_with(~paste0("category_2_", setdiff(1:50, unique(df$category_2))), starts_with("V2")) %>%
#   # Select and order columns: first category_1 columns, then category_2 columns
#   select(id, paste0("category_1_", all_category_1), paste0("category_2_", all_category_2))
# 
# # Print the original and transformed data frames
# print(df)
# print(df_transformed)
# 
# 
