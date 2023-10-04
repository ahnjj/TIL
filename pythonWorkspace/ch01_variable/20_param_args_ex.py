def order_coffee(coffee, *args):
    options = ' '.join(args) if args else "없음"
    print(f"{coffee}, 옵션: {options}")


order_coffee('아메리카노','Tall', 'HOT','시럽','stay')
order_coffee('카페라떼','Grande', 'ICE','go')