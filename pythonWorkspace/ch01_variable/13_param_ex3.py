def get_interest(deposit, int_rate):
    return deposit * int_rate / 100

deposit = int(input('예금액 입력 : '))
int_rate = float(input('이자율 입력(%) : '))
interest = get_interest(deposit, int_rate)

print('이자액 : {}원'.format(interest,',f'))