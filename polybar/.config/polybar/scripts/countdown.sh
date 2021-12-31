#!/bin/bash
# Days left until Elden Ring releases :)
echo $((($(date +%s --date "2022-2-25")-$(date +%s))/(3600*24))) days
