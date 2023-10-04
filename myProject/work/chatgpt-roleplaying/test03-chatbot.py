import openai
import os

openai.api_key = os.getenv("OPENAI_API_KEY")
print("api_key: ", repr(openai.api_key))

# chatbot 응답 생성
# role 에는 : system / user/ assistant 세가지
response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "당신은 지식이 풍부한 도우미입니다."},
        {"role": "user", "content": "세계에서 가장 큰 도시는 어디인가요?"},
    ],
)

print(response["choices"][0]["message"]["content"])  # receive response
