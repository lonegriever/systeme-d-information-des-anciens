class Api::ChartsDataController < ApplicationController
    def get_alumni_statistics
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
                    unemployed: calculate_percentages_for_year('unemployed', curr)
                }
            }
        end
        result_for_all_years
    end

    def calculate_percentages_for_year(employment_status, year)
        records_for_course = AlumnusRecord.where(course: params[:course], year_graduated: year)
        total =  records_for_course.count
        count = records_for_course.where(employment_status: employment_status).count
        # "#{count.to_f / total * 100}%"
        (count.to_f / total * 100).round(2);
    end
end