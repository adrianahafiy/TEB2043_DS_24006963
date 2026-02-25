# install n load packages
install.packages(c("dplyr", "tidyr", "stringr"))
library(dplyr)
library(tidyr)
library(stringr)

# Load dataset (tolerant encoding)
df <- read.csv("Unclean Dataset.csv",
               stringsAsFactors = FALSE,
               fileEncoding = "latin1")

# Normalise all character columns to UTF-8 (one-liner, keeps non-chars unchanged)
df[] <- lapply(df, function(x) if (is.character(x)) enc2utf8(x) else x)

# Clean special characters in Total_Payments
if ("Total_Payments" %in% names(df)) {
  df$Total_Payments <- df$Total_Payments %>%
    trimws() %>%                         # remove leading/trailing spaces
    str_replace_all("[^0-9.,-]", "") %>% # remove currency symbols/spaces
    str_replace_all(",", "") %>%         # drop thousands separators
    suppressWarnings(as.numeric())       # now safe to turn numeric
}

# Ensure expected columns exist
required_cols <- c("Student_ID","First_Name","Last_Name","Age","Gender")
for (nm in required_cols) if (!nm %in% names(df)) df[[nm]] <- NA_character_

# Trim and squish whitespace on key cols
df <- df %>%
  mutate(across(all_of(required_cols),
                ~ ifelse(is.na(.), "", str_squish(.))))

# 1) STUDENT_ID: extract digits; convert to integer
df <- df %>%
  mutate(Student_ID = suppressWarnings(as.integer(str_extract(Student_ID, "\\d+"))))

# 2) NAMES: if Last_Name is empty and First_Name has ≥2 tokens, split the LAST token to Last_Name
df <- df %>%
  mutate(
    .full = if_else((Last_Name == "" | is.na(Last_Name)) & str_detect(First_Name, "\\s+"),
                    First_Name, NA_character_),
    Last_Name  = if_else(!is.na(.full), str_replace(.full, "^.*\\s+(\\S+)$", "\\1"), Last_Name),
    First_Name = if_else(!is.na(.full), str_replace(.full, "\\s+\\S+$", ""), First_Name)
  ) %>%
  select(-.full)

# 3) GENDER & AGE: extract numbers to Age and M/F to Gender from either column
df <- df %>%
  mutate(
    age_from_age    = str_extract(Age, "\\d+"),
    age_from_gender = str_extract(Gender, "\\d+"),
    Age             = suppressWarnings(as.numeric(coalesce(age_from_age, age_from_gender))),
    
    g_from_gender   = str_extract(Gender, "(?i)[mf]"),
    g_from_age      = str_extract(Age %>% as.character(), "(?i)[mf]"),
    Gender          = toupper(coalesce(g_from_gender, g_from_age)),
    Gender          = if_else(Gender %in% c("M","F"), Gender, NA_character_)
  ) %>%
  select(-age_from_age, -age_from_gender, -g_from_gender, -g_from_age)

# Backfill missing Student_IDs with sequential integers
if (all(is.na(df$Student_ID))) {
  df$Student_ID <- 1000L + seq_len(nrow(df))
} else if (anyNA(df$Student_ID)) {
  start   <- suppressWarnings(max(df$Student_ID, na.rm = TRUE))
  if (!is.finite(start)) start <- 1000L
  n_miss  <- sum(is.na(df$Student_ID))
  df$Student_ID[is.na(df$Student_ID)] <- seq.int(from = start + 1L, length.out = n_miss)
}

# Basic inspection
cat("Sum of duplicates:", sum(duplicated(df)), "\n")
print(colSums(is.na(df)))
str(df)
summary(df)
head(df)

# remove duplicates
df <- df %>% distinct()
cat("Successful duplicate removal.\n")

# handle missing values
get_mode <- function(v) {
  uniqv <- unique(v[!is.na(v)])
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

df <- df %>%
  mutate(across(where(is.character), ~replace(., is.na(.), get_mode(.)))) %>%
  mutate(across(where(is.numeric),   ~replace(., is.na(.), median(., na.rm = TRUE))))

cat("Missing values successfully handled.\n")

# convert column data type accordingly (robust: only convert if it looks numeric)
df <- df %>%
  mutate(across(everything(), function(x) {
    if (is.character(x)) {
      x_clean <- str_replace_all(x, ",", "")
      # if the non-empty values are all numeric-like after comma removal, convert
      if (all(grepl("^\\s*$|^[-+]?\\d*(?:\\.\\d+)?$", x_clean))) {
        return(suppressWarnings(as.numeric(x_clean)))
      }
    } else {
      # keep existing numerics as is
      return(x)
    }
    x
  }))
cat("Successfully converted data types accordingly.\n")

# handle outliers using IQR
df_numeric <- df %>% select(where(is.numeric))

Q1  <- apply(df_numeric, 2, quantile, 0.25, na.rm = TRUE)
Q3  <- apply(df_numeric, 2, quantile, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

cat("Successfully handled outliers using IQR method.\n")

# remove rows with outliers
df_cleaned <- df %>%
  filter(!apply(df_numeric, 1, function(row) {
    any(row < (Q1 - 1.5 * IQR) | row > (Q3 + 1.5 * IQR))
  }))

cat("Successfully removed outliers.\n")

# save cleaned dataset
write.csv(df_cleaned, "Cleaned_Dataset.csv", row.names = FALSE)
cat("Cleaned dataset saved as 'Cleaned_Dataset.csv'\n")

# final checking
cat("Sum of duplicates:", sum(duplicated(df_cleaned)), "\n")
print(colSums(is.na(df_cleaned)))
str(df_cleaned)
summary(df_cleaned)
head(df_cleaned)

