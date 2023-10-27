import unittest
import sys
sys.path.append(r'/Users/jeong_ahn/TIL/algorithmWorkspace/a_basic/tests/MathTest.py')
from c_math import *

class MathTest(unittest.TestCase):
    def test_prime(self):
        self.assertTrue(is_prime(324931))  # 0.014s


    def test_prime2(self):
        self.assertTrue(is_prime2(324931))  # 0.006s

    def test_prime3(self):
        self.assertTrue(is_prime3(324931))  # 0.006s

    def test_gcd1(self):
        print('결과', gcd1(392304, 500289))
        # self.assertEqual(gcd1(12, 18), 6)  # 결과값이 뒤의 매개변수와 같으면 통과