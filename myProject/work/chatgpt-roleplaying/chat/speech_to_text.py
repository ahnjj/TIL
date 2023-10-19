import speech_recognition as sr
import sys # 텍스트 저장시 사용

ENGLISH = 'en-US'
JAPANESE = 'ja-JP'
CHINESE = 'zh-Hans-CN'

r = sr.Recognizer()
with sr.Microphone() as source:
    print("듣고 있어요")
    audio = r.listen(source)  # 마이크로부터 음성 듣기

    # 녹음된 음성을 구글에 쏘면 네트워크에서 처리해서 텍스트로 보내줌
    try: 
        # google api (하루 50회 제한)
        
        # text = r.recognize_google(audio, language=ENGLISH) # 영어
        # text = r.recognize_google(audio, language=JAPANESE) # 일본어
        text = r.recognize_google(audio, language=CHINESE) # 중국어
        # print(text)
        # 한국어
        # text = r.recognize_google(audio, language='ko')
        print(text)

    except sr.UnknownValueError:
        print('인식 실패')
    except sr.RequestError as e:
        print("요청 실패 : {0}".format(e))  # api key 오류, 네트워크 단절등
