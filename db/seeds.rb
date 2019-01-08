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
