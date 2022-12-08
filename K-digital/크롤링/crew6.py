# -*- coding: utf-8 -*-
"""
Created on Mon Aug  8 15:48:13 2022

@author: user
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome(r"C:\Users\user\Desktop\016_\week5\1\chromedriver.exe")
url = "https://naver.com"
driver.get(url)

element = driver.find_element(By.CLASS_NAME, "link_login")
print(element)
element.click()

time.sleep(1)
driver.back()
time.sleep(1)
driver.forward()
time.sleep(1)
driver.refresh()
time.sleep(1)
driver.back()