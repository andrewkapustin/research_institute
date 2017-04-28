if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)


# Отделы:
if (d1 = Department.find_by_name('Отдел терапии психических заболеваний')).nil?
  d1 = Department.create!(name: 'Отдел терапии психических заболеваний')
end
if (d2 = Department.find_by_name('Отдел экзогенно-органических расстройств и эпилепсии')).nil?
  d2 = Department.create!(name: 'Отдел экзогенно-органических расстройств и эпилепсии')
end
if (d3 = Department.find_by_name('Отдел психиатрической эндокринологии ')).nil?
  d3 = Department.create!(name: 'Отдел психиатрической эндокринологии ')
end

# Сотрудники
if (e1 = Employee.find_by_passport('7416789207')).nil?
  e1 = Employee.create!(
    last_name: 'Лавров',
    first_name: 'Игорь',
    patronymic: 'Михайлович',
    passport: '7416789207',
    itn: '789665000700',
    date_of_birth: '19.01.1985',
    post: 'Лаборант',
    department: d1
  )
end
if (e2 = Employee.find_by_passport('4413789201')).nil?
  e2 = Employee.create!(
    last_name: 'Филиппова',
    first_name: 'Екатерина',
    patronymic: 'Геннадьевна',
    passport: '4413789201',
    itn: '789665000766',
    date_of_birth: '10.07.1955',
    post: 'Лаборант',
    department: d1
  )
end
if (e3 = Employee.find_by_passport('8913789201')).nil?
  e3 = Employee.create!(
    last_name: 'Иванов',
    first_name: 'Иван',
    patronymic: 'Константинович',
    passport: '8913789201',
    itn: '789665000760',
    date_of_birth: '19.01.1959',
    post: 'Заведующий отделом',
    department: d2
  )
end
if (e4 = Employee.find_by_passport('6910709001')).nil?
  e4 = Employee.create!(
    last_name: 'Петрова',
    first_name: 'Ирина',
    patronymic: 'Викторовна',
    passport: '6910709001',
    itn: '789600000766',
    date_of_birth: '20.09.1974',
    post: 'Заведующий отделом',
    department: d3
  )
end

# Проекты:
if (p1 = Project.find_by_name('Проект1')).nil?
  p1 = Project.create!(
    name: 'Проект1',
    start_date: '01.01.2017',
    finish_date: '10.05.2017',
    price: '40000'
  )
end
if (p2 = Project.find_by_name('Проект2')).nil?
  p2 = Project.create!(
    name: 'Проект2',
    start_date: '05.03.2017',
    finish_date: '30.04.2017',
    price: '35000'
  )
end
if (p3 = Project.find_by_name('Проект3')).nil?
  p3 = Project.create!(
    name: 'Проект3',
    start_date: '10.04.2017',
    finish_date: '25.04.2017',
    price: '15000'
  )
end

# Проект-сотрудник:
EmployeeProjectCommunication.create(project: p1, employee: e1)
EmployeeProjectCommunication.create(project: p2, employee: e1)
EmployeeProjectCommunication.create(project: p2, employee: e2)
EmployeeProjectCommunication.create(project: p3, employee: e2)
EmployeeProjectCommunication.create(project: p3, employee: e3)
