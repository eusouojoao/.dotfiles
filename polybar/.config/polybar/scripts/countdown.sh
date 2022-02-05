#bin/bash
# Days left until Elden Ring releases :)
echo "Elden Ring -- countdown: $((($(date +%s --date "2022-2-25")-$(date +%s))/(3600*24*7))) weeks and $((($(date +%s --date "2022-2-25")-$(date +%s))/(3600*24) - 7*(($(date +%s --date "2022-2-25")-$(date +%s))/(3600*24*7)))) days"
