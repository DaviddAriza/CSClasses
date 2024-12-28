HOMEWORK_MAX = 800.0;
QUIZZES_MAX = 400.0;
MIDTERM_MAX = 150.0;
FINAL_MAX = 200.0;

student_status = input()
grades = input()
lst = grades.split(' ')
if lst[1] == '':
    for i in range(3):
        lst.remove('')
hw_points = float(lst[0])
qz_points = float(lst[1])
midterm_exam = float(lst[2])
final_exam = float(lst[3])

def get_averages():
    hw_ave = 100*hw_points/HOMEWORK_MAX
    qz_ave = 100*qz_points/QUIZZES_MAX
    midterm_ave = 100*midterm_exam/MIDTERM_MAX
    final_ave = 100*final_exam/FINAL_MAX

    if hw_ave >= 100:
        hw_ave = 100
    if qz_ave >= 100:
        qz_ave = 100
    if midterm_ave >= 100:
        midterm_ave = 100
    if final_ave >= 100:
        final_ave = 100

    if student_status == 'UG':
        course_ave = .2*hw_ave + .2*qz_ave + .3*midterm_ave + .3*final_ave
    elif student_status == 'G':
        course_ave = .15*hw_ave + .05*qz_ave + .35*midterm_ave + .45*final_ave
    elif student_status == 'DL':
        course_ave = .05*hw_ave + .05*qz_ave + .4*midterm_ave + .5*final_ave

    if course_ave >= 90:
        letter_grade = 'A'
    elif 80 <= course_ave <= 90:
        letter_grade = 'B'
    elif 70 < course_ave <= 80:
        letter_grade = 'C'
    elif 60 < course_ave <= 70:
        letter_grade = 'D'
    elif course_ave < 60:
        letter_grade = 'F'

    print(f'Homework: {hw_ave:.1f}%')
    print(f'Quizzes: {qz_ave:.1f}%')
    print(f'Midterm: {midterm_ave:.1f}%')
    print(f'Final Exam: {final_ave:.1f}%')
    print(student_status,f'average: {course_ave:.1f}%')
    print('Course grade:',letter_grade)

if student_status == 'UG':

    get_averages()

elif student_status == 'G':

    get_averages()

elif student_status == 'DL':

    get_averages()

else:
    print('Error: student status must be UG, G or DL')



