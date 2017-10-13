class Admin::DashboardsController < Admin::ApplicationController
	
   
    def index

           @hanghoas = Hanghoa.select("state_id", "created_at", "count(state_id) as sovd").where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week).group("state_id", "created_at")
         # @hanghoas =  Hanghoa.find_by_sql("SELECT DATE(`hanghoas`.`CREATED_AT`),`hanghoas`.`state_id`, count(`hanghoas`.`state_id`) as SOVANDON FROM `hanghoas` WHERE (DATE(`hanghoas`.`CREATED_AT`) BETWEEN '2017-10-09'AND '2017-10-15') GROUP BY DATE(`hanghoas`.`CREATED_AT`),`hanghoas`.`state_id`")
        # @hanghoas = Hanghoa.select(:id, :created_at, :tongcuoc, :state_id).order(tongcuoc: :desc).limit(10)
        category = []
        data1 = []
        values =[]
        @hanghoas.each do |hanghoa|
        category.push( { :label => hanghoa.created_at,
                         :stepSkipped => false,
                        :appliedSmartLabel=> true
        } )
        end 
       
        @hanghoas.each do |hanghoa|
        data1.push({

             # :seriesname => hanghoa.state_id,
            :label => hanghoa.created_at.to_date,
            :value => hanghoa.sovd
           
        })
        end

     

        @chart = Fusioncharts::Chart.new({
            :height => 400,
            :width => 600,
            :type => "line",
            :renderAt => 'chartContainer',
         
            :dataSource => {
                :chart => {

                    :caption => 'Thống kê vận đơn',
                    # :xAxisname => 'Vận đơn',
                    # :yAxisName => 'Số vận đơn',
                    # theme: "zune",
                     # exportEnabled: "1",
                    # :numberPrefix => 'VND',
                    :theme => 'fint',
                   
        # :numberprefix => "vnd",
        :plotgradientcolor => "",
        :bgcolor => "FFFFFF",
        :showalternatehgridcolor => "0",
        :divlinecolor => "CCCCCC",
        :showvalues => "0",
        :showcanvasborder => "0",
        :canvasborderalpha => "0",
        :canvasbordercolor => "CCCCCC",
        :canvasborderthickness => "1",
         :yaxismaxvalue => "20",
        :captionpadding => "30",
        :linethickness => "3",
        :yaxisvaluespadding => "2",
        :legendshadow => "0",
        :legendborderalpha => "0",
        :palettecolors => "#f8bd19,#008ee4,#33bdda,#e44a00,#6baa01,#583e78",
        :showborder=> "0"





                },
            
                # :categories => category,
                :data => data1
                
            }
        })
       @Tongvandonphatthanhcong = Hanghoa.where(:state_id => "7").count
       
    end
end