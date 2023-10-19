import speech_recognition as sr
from gtts import gTTS
from playsound import playsound
import os, time


# 음성 인식(듣기) (STT)
def listen(recognizer, audio):
    ENGLISH = 'en-US'
    JAPANESE = 'ja-JP'
    CHINESE = 'zh-Hans-CN'

    try: 
        # google api (하루 50회 제한)
        text = recognizer.recognizer_google(audio, language="ko")
        print('[나]'+text)
        # text = recognizer.recognize_google(audio, language=ENGLISH) # 영어
        # text = recognizer.recognize_google(audio, language=JAPANESE) # 일본어
        # text = recognizer.recognize_google(audio, language=CHINESE) # 중국어
    except sr.UnknownValueError:
        print('인식 실패')
    except sr.RequestError as e:
        print("요청 실패 : {0}".format(e))  # api key 오류, 네트워크 단절등


# 대답
def answer(input_text):
    pass


# 소리내어 읽기(TTS)
def speak(text):
    print('[인공지능]' + text)
    file_name = "voice.mp3"
    tts = gTTS(text=text, lang='ko')
    tts.save(file_name)
    playsound(file_name)  # 소리내서 읽기


r = sr.Recognizer()
m = sr.Microphone()   # 마이크

speak("무엇을 도와드릴까요?")
stop_listening = r.listen_in_background(m, listen) # 마이크로 소리가 들어올때마다 계속 백그라운드에서 듣고 인식한다. listen함수 호출
stop_listening(wait_for_stop=False) # 더 이상 듣지 않음


while True:
    time.sleep(0.1)
