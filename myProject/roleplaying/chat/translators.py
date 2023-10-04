from typing import Literal
import requests
from bs4 import BeautifulSoup

def google_translate(
        text:str,
        source: Literal['auto','en','ko'],
        target : Literal['en','ko'],
) -> str:
    text = text.strip()
    if not text:
        return ""
    
    endpoint_url = "https://translate.google.com/m"

    params = {
        "sl": source,
        "tl" : target,
        "q" : text,
        "ie" : "UTF-8",
        "prev":"_m",
    }

    # 안드로이드 User-Agent
    headers = {
        "User-Agent": ("Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19"
        "(KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19"
        ),
    }

    res = requests.get(
        endpoint_url,
        params=params,
        headers=headers,
        timeout=5,
    )
    res.raise_for_status()

    soup = BeautifulSoup(res.text, "html.parser")
    translated_text = soup.select_one(".result-container").text.strip()

    return translated_text