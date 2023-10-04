from urllib import response
import openai

openai.api_key = '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'

print(repr(openai.api_key))

# grammar correction
response = openai.Completion.create(
engine="text-davinci-003",
prompt="""
Fix grammar errors:
- I is a boy
- You is a girl""".strip(), )
print(response.choices[0].text.strip())

# chat completion
response = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=[
        {'role':'system', 'content':'You are a knowledgeable helper.'},
        {'role':'user', 'content':'Where is the biggest city in the world?'},
    ],
)
# print(response['choices'][0]['message']['content'])
print(response)