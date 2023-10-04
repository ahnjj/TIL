class Donation:
    total = 0

    def __init__(self, name, donation):
        self.name = name
        self.donation = donation
        self.add_donation()
        self.show_donation_info()
        self.show_total_donation()

    def add_donation(self):
        Donation.total += self.donation
    
    def show_donation_info(self):
        print('성명 : ',self.name)
        print('기부금 :', self.donation)

    def show_total_donation(self):
        print('총 기부금 :', Donation.total)

    
p1 = Donation('홍길동', 3000)

print('-----------------------')
p2 = Donation('성춘향', 4000)
