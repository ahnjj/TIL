import openai

# API KEY 설정에 오류가 있는 지 확인하기 위함
print("api_key :", repr("OPENAI_API_KEY"))

# 텍스트 생성 혹은 문서 요약
# grammar error fix
response = openai.Completion.create(
    engine="text-davinci-003",
    prompt="""
Fix grammar errors:
- I is a boy  
- You is a girl""".strip(),
)

print(response.choices[0].text.strip())
