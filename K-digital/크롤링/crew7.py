# -*- coding: utf-8 -*-
"""
Created on Mon Aug  8 16:25:59 2022

@author: user
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome(r"C:\Users\user\Desktop\016_\week5\1\chromedriver.exe")
url = "https://naver.com"
driver.get(url)

element = driver.find_element(By.TAG_NAME, 'a')
# print(element.get_attribute('href'))
elements = driver.find_elements(By.TAG_NAME, 'a')

for idx, e in enumerate(elements):
    ele = e.get_attribute('href')
    print(ele)
    time.sleep(0.5)
    
//*[@id="search_btn"]