echo "Start of Script..."

URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

wget -P ./raw $URL

FNAME=$(echo $URL | cut -d '/' -f 9)

# Use an if-else statement to check if the file exists.
if [ -f "./raw/$FNAME" ]
then
    echo "./raw/$FNAME exits."
else
    echo "./raw/$FNAME does not exist."
fi

tr "Variable_code" "variable_code" < ./raw/$FNAME > ./raw/$FNAME

mkdir Transformed

cut -d, -f1,5,6,9 test.csv > Transformed/2023_year_finance.csv

if [ -f "Transformed/2023_year_finance.csv" ]
then
    echo "Transformed/2023_year_finance.csv exits."
else
    echo "Transformed/2023_year_finance.csv does not exist."
fi

echo "Loading Operation..."

mkdir Gold

mv Transformed/2023_year_finance.csv Gold/

if [ -f "Gold/2023_year_finance.csv" ]
then
    echo "Gold/2023_year_finance.csv exits."
else
    echo "Gold/2023_year_finance.csv does not exist."
fi

echo "End of Script"


