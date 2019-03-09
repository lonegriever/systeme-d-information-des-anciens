class Api::ChartsDataController < ApplicationController

    def get_alumni_statistics
        initialize_records_for_course
        response = build_result
        render json: {
            message: 'noice',
            data: response
        }, status: :ok
    end

    def get_employed_count
        initialize_employed_records_for_year
        response = build_employed_count_result
        render json: {
            message: 'success',
            data: response
        }, status: :ok
    end

    private

    def build_result
        result_for_all_years = params[:years].inject([]) do |acc, curr|
            acc << {
                "#{curr}": {
                    employed: calculate_percentages_for_year('employed', curr),
                    unemployed: calculate_percentages_for_year('unemployed', curr),
                    employed_count: get_records_count('employed', curr),
                    unemployed_count: get_records_count('unemployed', curr),
                    total_count: @records_for_course.where(year_graduated: curr).count
                }
            }
        end
        result_for_all_years
    end

    def calculate_percentages_for_year(employment_status, year)
        total =  @records_for_course.where(year_graduated: year).count
        count = @records_for_course.where(employment_status: employment_status, year_graduated: year).count
        (count.to_f / total * 100).round(2);
    end

    def get_records_count employment_status, year
        @records_for_course.where(year_graduated: year, employment_status: employment_status).count
    end

    def initialize_records_for_course
        @records_for_course = AlumnusRecord.where(course: params[:course])
    end

    def initialize_employed_records_for_year
        @employed_count_for_year = AlumnusRecord.where(year_graduated: params[:selectedYear])
    end

    def build_employed_count_result
        courses = [
                'Bachelor of Science in Information Technology',
                'Bachelor of Science in Hospitality Management',
                'Bachelor of Science in Criminology',
                'Bachelor of Science in Tourism Management',
                'Bachelor of Arts in Communication',
                'Bachelor of Science in Business Administration',
                'Bachelor of Science on Accountancy',
                'Bachelor of Science in Psychology',
                'Bachelor of Science in Computer Science'
        ]
        result = {}
        courses.each do |course|
            result.store(course, get_employed_count_for_course(course))
        end
        result
    end

    def get_employed_count_for_course course
        @employed_count_for_year.where(course: course).count
    end
end