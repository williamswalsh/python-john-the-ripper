import csv

with open('derby.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        
        
        title = row[0].replace('setting.','')
        
        # make a file with title "title"
        f = open("./out/" + title ,"w+")
        
        # add row[1] content to file row[0]
        f.write(row[1])