# -*- coding: utf-8 -*-
"""
Created on Mon Aug  8 16:51:27 2022

@author: user
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from datetime import date
import time
import pyperclip
import openpyxl

# 나올 때 까지 기다리는 함수
def wait_until(xpath_str):
    WebDriverWait(driver,30).until(EC.presence_of_element_located((By.XPATH,xpath_str)))

driver = webdriver.Chrome(r"C:\Users\user\Desktop\016_\week5\1\chromedriver.exe")
url = "https://naver.com/"
driver.get(url)

element = driver.find_element(By.ID, 'query')
element.send_keys('네이버 항공권')
element = driver.find_element(By.XPATH,"//*[@id='search_btn']")
element.click()
time.sleep(1)
element = driver.find_element(By.XPATH, "//*[@id='main_pack']/section[1]/div/div/div[1]/div/div[2]/a")
element.click()
driver.switch_to.window(driver.window_handles[-1])
element = driver.find_element(By.ID, '__next')
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[4]/div/div/div[2]/div[1]/button[2]/b").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[9]/div[2]/section/section/button[2]").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[9]/div[2]/section/section/div/button[2]/span/i[1]").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[4]/div/div/div[2]/div[2]/button[1]").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[9]/div[2]/div[1]/div[2]/div/div[2]/table/tbody/tr[3]/td[2]/button/b").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[9]/div[2]/div[1]/div[2]/div/div[2]/table/tbody/tr[3]/td[6]/button/b").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[4]/div/div/button/span").click()
# elem 함수 적용 시 로딩 완료되면 바로 넘어감
# elem = WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.XPATH,"//*[@id='__next']/div/div[1]/div[5]/div/div[3]/div[1]/div/button")))
wait_until("//*[@id='__next']/div/div[1]/div[5]/div/div[3]/div[1]/div/button")
#time.sleep(15)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[5]/div/div[3]/div[1]/div/button").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[5]/div/div[3]/div[1]/div/div[2]/div[2]/div[1]/a").click()
time.sleep(1)
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div/div").click()
wait_until("//*[@id='__next']/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[2]/a/b")
element = driver.find_element(By.XPATH,"//*[@id='__next']/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[2]/a/b").click()
# 핸들 위치를 옮겨줌
driver.switch_to.window(driver.window_handles[-1])
wait_until("//*[@id='fixArea']/a")
# time.sleep(8)
# print(driver.window_handles)
element = driver.find_element(By.XPATH,"//*[@id='fixArea']/a").click()
time.sleep(1)
pyperclip.copy('조성현')
element = driver.find_element(By.XPATH,"//*[@id='memberId']").send_keys(Keys.CONTROL , 'v')
pyperclip.copy('123456789')
element = driver.find_element(By.XPATH,"//*[@id='memberPw']").send_keys(Keys.CONTROL , 'v')
time.sleep(5)
driver.quit()

