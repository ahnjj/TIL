from abc import *

class DrawingObject(metaclass=ABCMeta):
    def __init__(self):
        self.__pen_color = ''

    @abstractmethod
    def draw(self):
        pass