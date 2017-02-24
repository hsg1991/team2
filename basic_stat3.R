#####
# Visualize # articles / year in each paper stacked
#####

# Load statistics from "Exploratory"


library(datasets)


DAILY_PATH = "daily.csv"
GUARDIAN_PATH = "theguardian.csv"
INDEPENDENT_PATH = "independent.csv"
TELEGRAPH_PATH = "telegraph.csv"

# read news articles
daily <- read.csv(DAILY_PATH, header = TRUE, sep = ",")
guardian <- read.csv(GUARDIAN_PATH, header = TRUE, sep = ",")
independent <- read.csv(INDEPENDENT_PATH, header = TRUE, sep = ",")
telegraph <- read.csv(TELEGRAPH_PATH, header = TRUE, sep = ",")

daily_year <- format(as.Date(daily$publication_date), "%Y")
guardian_year <- format(as.Date(guardian$publication_date), "%Y")
independent_year <- format(as.Date(independent$publication_date), "%Y")
telegraph_year <- format(as.Date(telegraph$publication_date), "%Y")

years = sort(union(union(union(daily_year, guardian_year), independent_year), telegraph_year))

NUM_PAPERS = 4
PAPER_NAMES <- c("daily", "independent", "thegaurdian", "telegraph")
YEARLY_COUNTS <- matrix(0, length(years), NUM_PAPERS)
colnames(YEARLY_COUNTS) = PAPER_NAMES
rownames(YEARLY_COUNTS) = years

da <- table(daily_year)
ga <- table(guardian_year)
ia <- table(independent_year)
ta <- table(telegraph_year)

YEARLY_COUNTS[names(da),PAPER_NAMES[1]] = da
YEARLY_COUNTS[names(ga),PAPER_NAMES[2]] = ga
YEARLY_COUNTS[names(ia),PAPER_NAMES[3]] = ia
YEARLY_COUNTS[names(ta),PAPER_NAMES[4]] = ta
