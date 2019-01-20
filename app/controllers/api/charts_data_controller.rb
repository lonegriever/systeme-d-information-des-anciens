class Api::ChartsDataController < ApplicationController

    def get_alumni_statistics
        initialize_records_for_course
        response = build_result
        render json: {
            message: 'noice',
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
end