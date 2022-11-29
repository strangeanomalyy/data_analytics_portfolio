import pandas as pd 

# Importing dataframe 
df = pd.read_excel("Philippine Senior High Schools.xlsx")

# Fixing the column headers 
col_headers = df.iloc[0]
df.columns = col_headers
df.drop(0, axis = 0, inplace = True)

# Splitting the values in the column and making a new column of lists 
programs = df["PROGRAM OFFERINGS"]
taxonomy = df["TAXONOMY"]
programs_list = programs.str.split(pat = "|")
taxonomy_list = taxonomy.str.split(pat = "|")
df["PROGRAMS LIST"] = programs_list
df["TAXONOMY LIST"] = taxonomy_list

# Total number of rows to do iteration on
rows = 4910

######
# Counts the rows where the strand/track is offered (By school, nationwide)
def program_total(a,b): #a-e
    d = 0
    for c in range(1,b):
        if a in df["PROGRAMS LIST"].iloc[c]:
            e = 1
        else:
            e = 0
        d = d + e
    return(d)

# Counts the rows where the strand/track is offered (By region)
def program_region(f,m,g):
    j = 0
    for h in range(1,g):
        if f in df["TAXONOMY LIST"].iloc[h] and m in df["PROGRAMS LIST"].iloc[h]:
            k = 1
        else: 
            k = 0
        j = j + k
    return(j)

#####

prompt = str(input("Nationwide or By Region? "))
if prompt == "Nationwide":
    # How many schools nationwide are offering each of these strands/tracks?
    strand = str(input("What is the strand/track? "))
    total = program_total(strand,rows)
    print("The number of Schools with the ",strand, "track is ", total,".")
    
if prompt == "By Region":
    # How many schools are offering these strands/tracks per region? 
    region = str(input("What region would you like to look at? "))
    strand = str(input("What is the strand/track? "))
    by_region = program_region(region,strand,rows)
    print("The number of Schools offering the ",strand, "track from ", region, "is ", by_region,".")
else: 
    print("I do not understand. Self destruct sequence in 3...2...1...")


