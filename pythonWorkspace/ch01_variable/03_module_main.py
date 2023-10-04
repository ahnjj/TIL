name = ""    # global variable

def input_name():
    global name         # to change global variable(new value 저장)
    name = input('이름 입력 : ')


def get_name():
    if name == "":
        return "이름 없음"
    else:
        return name
    

# 현재 파일이 단독 실행되면 수행되고 다름파일에 IMport 되면 수행하지 않음
if __name__ == "__main__":
    input_name()
    print(get_name())