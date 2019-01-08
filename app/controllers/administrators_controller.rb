class AdministratorsController < ApplicationController
    def alumni_list
        @alumnus_records = AlumnusRecord.all
    end
end
