import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime


URL = "https://www.officialgazette.gov.ph/nationwide-holidays/"
year = ["2018","2019","2020","2021","2022","2023"]

holidays = pd.DataFrame()
for i in year:
    URL_1 = URL+i
    page = requests.get(URL_1)
    soup = BeautifulSoup(page.content, "html.parser")
    results = soup.find(id='nationwide_holidays')
    holiday_name = results.find_all('div', class_='holiday-what')
    holiday_date = results.find_all('td', class_= 'holiday-when')
    
    holiday_list = []
    for name in holiday_name:
        holiday_list.append(name.text.strip())
    
    holidate_list = []
    for date in holiday_date:
        string_to_date = date.abbr['title']
        date_object = datetime.strptime(string_to_date, "%B %d, %Y")
        calendar_date = date_object.date()
        holidate_list.append(calendar_date)
        
    df = pd.DataFrame({'Holiday_Name': holiday_list,
                       'Date': holidate_list})
    df
    URL_1 = URL
    holidays = pd.concat([holidays,df])

holidays.to_csv('holidays_webscraped.csv', index=False)
