User.create!(
    username: 'griever',
    password: 'password',
    admin: true
)

AlumnusRecord.create!(
    first_name: "Edmond",
    email: 'edmond@gmail.com',
    last_name: "Dantes",
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Information Technology',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

AlumnusRecord.create!(
    first_name: "Isaac",
    last_name: "Clarke",
    email: 'isaac@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Mechanical Engineering',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

AlumnusRecord.create!(
    first_name: "Darren",
    last_name: "Hayes",
    email: 'darren@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Music',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

AlumnusRecord.create!(
    first_name: "Josh",
    last_name: "Santana",
    email: 'edmond@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Biology',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

AlumnusRecord.create!(
    first_name: "Eric",
    last_name: "Nylund",
    email: 'eric@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Chemistry',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

AlumnusRecord.create!(
    first_name: "Zakir",
    last_name: "Naik",
    email: 'zakir@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Medical Technology',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Unemployed"
)

AlumnusRecord.create!(
    first_name: "Muhammad",
    last_name: "Hijab",
    email: 'mo@gmail.com',
    gender: "Male",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Business Administration',
    date_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Unemployed"
)

