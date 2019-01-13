module ApplicationHelper
    def courses
        [
            ['Bachelor of Science in Information Technology','Bachelor of Science in Information Technology (BSIT)'],
            ['Bachelor of Science in Hospitality Management','Bachelor of Science in Hospitality Management (BSHM)'],
            ['Bachelor of Science in Tourism Management','Bachelor of Science in Tourism Management (BSTM)'],
            ['Bachelor of Arts in Communication','Bachelor of Arts in Communication (BACOMM)'],
            ['Bachelor of Science in Business Administration','Bachelor of Science in Business Administration (BSBA)'],
            ['Bachelor of Science on Accountancy','Bachelor of Science on Accountancy (BSA)'],
            ['Bachelor of Science in Psychology', 'Bachelor of Science in Psychology (AB Psych)'],
            ['Bachelor of Science in Criminology', 'Bachelor of Science in Criminology'],
            ['Bachelor of Science in Computer Science', 'Bachelor of Science in Computer Science']
        ]
    end

    def year_graduated_options
        year_options = []
        80.times do |index|
            year_options << [(1970 + index).to_s, (1970 + index).to_s]
        end
        year_options
    end
end
