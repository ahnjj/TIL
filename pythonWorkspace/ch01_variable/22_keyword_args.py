def student_info(name, age, gender):
    student = {
        'name' : name,
        'age' : age,
        'gender' : gender
    }
    return student

print(student_info(name='kim', age=20, gender='f'))
print(student_info('lee', gender='m', age=30))
# print(student_info(name = 'lee', 'm', age=30)) 