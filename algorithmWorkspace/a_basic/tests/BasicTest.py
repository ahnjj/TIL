import unittest
import sys
sys.path.append(r'/Users/jeong_ahn/TIL/algorithmWorkspace/a_basic/tests/BasicTest.py')
from b_loop import *


class BasicTest(unittest.TestCase): 
    def test_q1(self):
        q1()
    def test_q5(self):
        q5()
    def test_q6(self):
        q6()

if __name__ == '__main__':
    unittest.main()