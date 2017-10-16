class Nhanvien::ReportsController < Nhanvien::ApplicationController
	 def index

           @hanghoas = Hanghoa.select("state_id, DATE(created_at) as ngay, count(state_id) as sovd").where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week).group("state_id, DATE(created_at)")
           @ngaytaos = Hanghoa.select("DATE(created_at) as ngay").distinct
           @vuataos = Hanghoa.select("count(state_id) as sovd, state_id, DATE(created_at) as ngay").where(:state_id => '5').group("state_id, DATE(created_at)")
           @thanhcongs = Hanghoa.select("count(state_id) as sovd, state_id, DATE(created_at) as ngay").where( :state_id => '6').group("state_id, DATE(created_at)")
           @chuyenhoans = Hanghoa.select("count(state_id) as sovd, state_id, DATE(created_at) as ngay").where(:state_id => '7').group("state_id, DATE(created_at)")
           @vuatao_pies = Hanghoa.where(:state_id => '5').count
           @chuyenhoan_pies = Hanghoa.where(:state_id => '6').count
           @phatthanhcong_pies = Hanghoa.where(:state_id => '7').count
           @chuyenphat_pies = Hanghoa.where(:state_id => '8').count
           
          @tongtts = Hanghoa.count(:state_id)
          @vt_pie = (@vuatao_pies *100)/ @tongtts
          @ch_pie = (@chuyenhoan_pies *100)/ @tongtts
          @ptt_pie = (@phatthanhcong_pies *100)/ @tongtts
          @cp_pie = (@chuyenphat_pies *100)/ @tongtts

         
         # @hanghoas =  Hanghoa.find_by_sql("SELECT DATE(`hanghoas`.`CREATED_AT`),`hanghoas`.`state_id`, count(`hanghoas`.`state_id`) as SOVANDON FROM `hanghoas` WHERE (DATE(`hanghoas`.`CREATED_AT`) BETWEEN '2017-10-09'AND '2017-10-15') GROUP BY DATE(`hanghoas`.`CREATED_AT`),`hanghoas`.`state_id`")
        # @hanghoas = Hanghoa.select(:id, :created_at, :tongcuoc, :state_id).order(tongcuoc: :desc).limit(10)
        category = []
        datavt = []
        datathanhcong =[]
        datachuyenhoan = []
        values =[]
        @ngaytaos.each do |ngaytao|
        category.push( { :label => ngaytao.ngay,
                        #  :stepSkipped => false,
                        # :appliedSmartLabel=> true
        } )
        end 
       
        @vuataos.each do |vuatao|
        datavt.push({

            :value => vuatao.sovd
            # :value => hanghoa.sovd
           
        })
          end
        @thanhcongs.each do |thanhcong|
        datathanhcong.push({

            :value => thanhcong.sovd
            # :value => hanghoa.sovd
           
        })
        end
        @hanghoas.each do |hanghoa|
        values.push({
            :value => hanghoa.sovd
           
        })
        end
        @chuyenhoans.each do |chuyenhoan|
        datachuyenhoan.push({
            :value => chuyenhoan.sovd
           
        })
        end

     

        @chart = Fusioncharts::Chart.new({
            :height => 300,
            :width => 500,
            :type => "msline",
            :renderAt => 'chartContainer1',
         
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
         :yaxismaxvalue => "10",
        :captionpadding => "30",
        :linethickness => "3",
        :yaxisvaluespadding => "1",
        :legendshadow => "0",
        :legendborderalpha => "0",
        :palettecolors => "#f8bd19,#008ee4,#33bdda,#e44a00,#6baa01,#583e78",
        :showborder=> "0"
        },
            
                :categories => {:category => category},
                :dataset => [{
                    "seriesname": "vừa tạo" ,
                    :data => datavt
                    },
                    {
                    "seriesname": "đã chuyển" ,
                    :data => datathanhcong
                    },
                    {
                    "seriesname": "chuyển hoàn" ,
                    :data => datachuyenhoan
                    },
                ]
                  }
                
            
        })

        @chart_pie = Fusioncharts::Chart.new({
            :height => 300,
            :width => 500,
            :type => "pie2d",
            :renderAt => 'chartContainer',
         
            :dataSource => {
                :chart => {
        :caption => "Expenditures Incurred in Publishing a Book",
        :bgcolor => "FFFFFF",
        :showvalues => "1",
        :showpercentvalues => "1",
        :showborder => "0",
        :showplotborder => "0",
        :showlegend => "1",
        :legendborder => "0",
        :legendposition => "bottom",
        :enablesmartlabels => "1",
        :use3dlighting => "0",
        :showshadow => "0",
        :legendbgcolor => "#CCCCCC",
        :legendbgalpha =>"20",
        :legendborderalpha => "0",
        :legendshadow => "0",
        :legendnumcolumns => "3",
        :palettecolors => "#f8bd19,#e44a00,#008ee4,#33bdda,#6baa01,#583e78"
    },
    :data => [
        {
            :label => "Vừa tiếp nhận",
            :value => @vt_pie
        },
        {
            :label => "Chuyển hoàn",
            :value => @ch_pie
        },
        {
             :label => "Phát thành công",
            :value => @ptt_pie
        },
        {
            :label => "Đã chuyển phát",
            :value => @cp_pie
        },
        
    ]

                
       }     
        })

       @Tongvandonphatthanhcong = Hanghoa.where(:state_id => "7").count
       
    end
end
