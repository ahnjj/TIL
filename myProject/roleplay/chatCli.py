import os
import openai

from dotenv import load_dotenv
load_dotenv()

# openai.api_key = os.getenv("OPENAI_API_KEY")
openai.api_key = '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'


language = "English"
gpt_name = "Steve"
level_string = f"a beginner in {language}"  
level_word = "simple" 
situation_en = "make new friends"
my_role_en = "me"
gpt_role_en = "new friend"

initial_system_prompt = (
    f"You are helpful assistant supporting people learning {language}. "
    f"Your name is {gpt_name}. "
    f"Please assume that the user you are assisting is {level_string}. "
    f"And please write only the sentence without the character role."
)
initial_user_prompt = (
    f"Let's have a conversation in {language}. "
    f"Please answer in {language} only "
    f"without providing a translation. "
    f"And please don't write down the pronunciation either. "
    f"Let us assume that the situation in '{situation_en}'. "
    f"I am {my_role_en}. The character I want you to act as is {gpt_role_en}. "
    f"Please make sure that I'm {level_string}, so please use {level_word} words "
    f"as much as possible. Now, start a conversation with the first sentence!"
)

messages = [
    {"role": "system", "content": initial_system_prompt},
    {"role": "user", "content": initial_user_prompt},
]
def gpt_query(user_query: str = "", skip_save: bool = False) -> str:
    global messages
    if user_query:
        messages.append({
            "role": "user",
            "content": user_query,
        })
    
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo", messages=messages, temperature=1
    )
    assistant_message = response["choices"][0]["message"]["content"]
    if skip_save is False:
        messages.append({
            "role": "assistant",
            "content": assistant_message,
        })
    return assistant_message


def main():

    # 초기 응답 출력
    assistant_message = gpt_query()
    print(f"[assistant] {assistant_message}")

    try:
        while line:=input("[user]").strip():
            response=gpt_query(line)
            print("[assistant]{}".format(response))
    except (EOFError, KeyboardInterrupt):
        print("terminated by user.")

if __name__=="__main__":
    main()


