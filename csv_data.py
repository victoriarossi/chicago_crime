# File to add a column of ID to the csv file

import csv
i=0
with open('Chicago_Crimes_2023.csv','r') as csvinput:
    with open('Chicago_Crimes_2023_updated.csv', 'w') as csvoutput:
        writer = csv.writer(csvoutput)
        for row in csv.reader(csvinput):
            writer.writerow([i]+row)
            i += 1