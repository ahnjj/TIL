from DrawingObject import *

class Rect(DrawingObject):
    def __init__(self):
        self.__pen_color = "green"
    
    def draw(self):
        print(f"{self.__pen_color}색상으로 사각형 그리기")
        