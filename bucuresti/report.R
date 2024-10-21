library(here)

scriptBaseFolder <- "bucuresti"

questions <- c('I1',
               'I2',
               'I3',
               '4. Ce i-a influențat cel mai mult pe elevi în alegerea făcută?',
               '5. Cu cine s-au consultat elevii în alegerea școlii pe care doresc să o urmeze?',
               'I6',
               'I7',
               '8. În ce domeniu de activitate ar prefera elevii să lucreze?')

table1 <- read.csv(paste0(here(scriptBaseFolder), "/source/table1.csv"), sep = ",")
table2 <- read.csv(paste0(here(scriptBaseFolder), "/source/table2.csv"), sep = ",")
table4 <- read.csv(paste0(here(scriptBaseFolder), "/source/table4.csv"), sep = ",")
table5 <- read.csv(paste0(here(scriptBaseFolder), "/source/table5.csv"), sep = ",")
table8 <- read.csv(paste0(here(scriptBaseFolder), "/source/table8.csv"), sep = ",")

table_specializari <- read.csv(paste0(here(scriptBaseFolder), "/source/table_specializari.csv"), sep = ",")

#xx <- c(table1$total[2], table1$total[3], table1$total[4])


#pillColors = c(colors[1], colors[2], colors[3])

#table4Graph <- subset(table4, select = c(factor, total))
#table4MaxGraphValue <- round(max(table4Graph$total), -3)
#table4Graph <- table4Graph %>%
#  mutate(percent = total/table4MaxGraphValue*100)

prepareRegularTableForDiplay <- function(tableX)
{
  colnames(tableX) <- c('Opțiuni exprimate', 'Total B', 'Din S1', 'Din S2', 'Din S3', 'Din S4', 'Din S5', 'Din S6')
  return(tableX)
}

prepareRegularTableForGraph <- function(tableX)
{
  tableGraph <- subset(tableX, select = c(factor, total))
  tableMaxGraphValue <- round(max(tableGraph$total), -3)
  tableGraph <- tableGraph %>%
    mutate(percent = total/tableMaxGraphValue*100)
  return(tableGraph)
}
