# -*- coding: utf-8 -*-
"""
Created on Tue Aug  9 09:15:21 2022

@author: user
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import pyperclip

driver = webdriver.Chrome(r"C:\Users\user\Desktop\016_\week5\1\chromedriver.exe")
url = "https://www.naver.com/"
driver.get(url)

element = driver.find_element(By.XPATH,"//*[@id='account']/a").click()
time.sleep(0.5)
pyperclip.copy('ghkdrma1843')
element = driver.find_element(By.XPATH,"//*[@id='id'] ").send_keys(Keys.CONTROL , 'v')
pyperclip.copy('123456789')
element = driver.find_element(By.XPATH,"//*[@id='pw']").send_keys(Keys.CONTROL, 'v')
element = driver.find_element(By.XPATH,"//*[@id='log.login']/span").click()
