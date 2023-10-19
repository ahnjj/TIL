from gettext import textdomain
import speech_recognition as sr

# result = Element("result")

# 음성 인식(듣기) (STT)
def listen():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("듣고 있어요")
        audio = r.listen(source)  # 마이크로부터 음성 듣기
        ENGLISH = 'en-US'
        JAPANESE = 'ja-JP'
        CHINESE = 'zh-Hans-CN'

        try: 
            # google api (하루 50회 제한)
            text = r.recognize_google(audio, language="ko")
            # print('[나]'+text)
            # text = recognizer.recognize_google(audio, language=ENGLISH) # 영어
            # text = recognizer.recognize_google(audio, language=JAPANESE) # 일본어
            # text = recognizer.recognize_google(audio, language=CHINESE) # 중국어
            # result.element.innerText = f"{text}"

        except sr.UnknownValueError: # 음성을 잘 못인식 할 때
            print('인식 실패')
        except sr.RequestError as e:
            print("요청 실패 : {0}".format(e))  # api key 오류, 네트워크 단절등
    return text

# js에서 사용할수 있도록
if __name__ == "__main__":
    listen()


# stt = listen()
# print('결과: ', stt)

