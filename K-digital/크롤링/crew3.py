# -*- coding: utf-8 -*-
"""
Created on Mon Aug  8 10:09:49 2022

@author: user
"""

import requests
from bs4 import BeautifulSoup
url = "https://search.daum.net/search?w=tot&q=2021%EB%85%84%EC%98%81%ED%99%94%EC%88%9C%EC%9C%84&DA=MOR&rtmaxcoll=MORsrc=%22https://search1.kakaocdn.net/thumb/R232x328.q85/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F4fc5880afdb5b7c60161f34184e1f466814fec2d%22"

# 크롤링 : 다음 역대관객 순위
res = requests.get(url)
res.raise_for_status()

# 스크리핑
soup = BeautifulSoup(res.text, "html.parser")
images = soup.find_all("img" , attrs = {"class" : "thumb_img"})

print(images[0]['src'])