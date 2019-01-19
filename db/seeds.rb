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
    year_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Employed"
)

EmploymentRecord.create!(
    company_name: 'Accenture',
    position: 'Network Administrator',
    date_started: Time.now.to_date - 1.year,
    salary: 25000,
    alumnus_record_id: 1
)

AlumnusRecord.create!(
    first_name: "Dana",
    last_name: "Scully",
    email: 'dana@gmail.com',
    gender: "Female",
    birth_date: Time.now.to_date.to_formatted_s,
    course: 'Bachelor of Science in Criminology',
    year_graduated: Time.now.to_date.to_formatted_s,
    employment_status: "Unemployed",
    reason_for_unemployment: "I haven't found a company that matches my salary expections in the Province of Negros Occidental."
)

# Create seed data for Bachelor of Science in Information Technology here

75.times do
    first_name = Faker::Name.male_first_name
    random = Faker::Number.between(0, 1)
    employment_status = random == 0 ? "Unemployed" : "Employed"
    rec = AlumnusRecord.create!(
        first_name: first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email(first_name),
        gender: "Male",
        birth_date: Faker::Date.between(Time.now.to_date - 20.years, Time.now.to_date - 30.years),
        course: 'Bachelor of Science in Information Technology',
        year_graduated: Faker::Number.between(2014, 2019),
        employment_status: employment_status,
        reason_for_unemployment: Faker::Quote.yoda
    )
    if rec.employment_status == 'employed'
        EmploymentRecord.create!(
            company_name: Faker::Company.name,
            position: Faker::Company.profession,
            date_started: Date.new(rec.year_graduated, Faker::Number.between(1, 12), Faker::Number.between(2, 27)),
            salary: Faker::Number.between(15000, 100000),
            alumnus_record_id: rec.id
        )
    end
end

25.times do
    first_name = Faker::Name.female_first_name
    random = Faker::Number.between(0, 1)
    employment_status = random == 0 ? "Unemployed" : "Employed"
    rec = AlumnusRecord.create!(
        first_name: first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email(first_name),
        gender: "Female",
        birth_date: Faker::Date.between(Time.now.to_date - 20.years, Time.now.to_date - 30.years),
        course: 'Bachelor of Science in Information Technology',
        year_graduated: Faker::Number.between(2014, 2019),
        employment_status: employment_status,
        reason_for_unemployment: Faker::Quote.yoda
    )

    if rec.employment_status == 'employed'
        EmploymentRecord.create!(
            company_name: Faker::Company.name,
            position: Faker::Company.profession,
            date_started: Date.new(rec.year_graduated, Faker::Number.between(1, 12), Faker::Number.between(2, 27)),
            salary: Faker::Number.between(15000, 100000),
            alumnus_record_id: rec.id
        )
    end
end

