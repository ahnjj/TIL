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
        print('결과', gcd1(900000, 500289))
        # self.assertEqual(gcd1(12, 18), 6)  # 결과값이 뒤의 매개변수와 같으면 통과
    def test_gcd2(self):
        print('결과', gcd2(900000, 500289))

    def test_lcm(self):
        print(lcm(900000, 1680540))

    def test_fac(self):
        self.assertEqual(factorial1(4),24)
    # 재귀
    def test_fac2(self):
        self.assertEqual(factorial1(4),24)
    # 꼬리재귀
    def test_fac3(self):
        self.assertEqual(factorial_tail(4),24)

    
    