
prawn_document(:page_layout => :landscape) do |pdf|
	config = Setting.first
	if config 
	pdf.text config.name.upcase, :size => 20, :style => :bold, :align => :center
	pdf.text config.addresses.first.direccion + " - " + config.addresses.first.city.city + " - " + config.addresses.first.city.departamento.departamento + " - " + config.addresses.first.city.departamento.country.country, :size => 11, :style => :italic, :align => :center
	pdf.text "Teléfono/Fax: "+ config.phone + " - Email: " + config.email, :size => 11, :style => :italic, :align => :center
	pdf.move_down(10) 
	end


	pdf.text "Listado de Usuarios #{Date.today.year}", :size => 15, :style => :bold 
	pdf.text "Cantidad de usuarios: #{@users.size}", :size => 11, :style => :italic
	pdf.move_down(20)  
	items = [ ["<b>Nro</b>","<b>Nombre</b>", "<b>CINro</b>", "<b>Email</b>", "<b>Telefono</b>", "<b>Fecha de Registro</b>"]  ]

	items += @users.each_with_index.map do |item,i|  
	  [  
	        i+1,
	        item.full_name,  
	        item.person.doc,
	        item.email,
	        item.person.phone,
	        item.created_at.to_s.slice(0,10)
	  ]  
	end 

	pdf.table(items, 
	          :header => true,
	          :position => :center, 
	          :row_colors => ["F0F0F0", "FFFFCC"],
	          :cell_style => { :inline_format => true, :font => "Times-Roman", :font_style => :italic })
	 
	pdf.move_down(20)

	pdf.text "Autor: #{current_user.full_name.inspect}", :size => 8, :align => :center
	pdf.text "Fecha y Hora: #{Time.now}", :size => 8, :align => :center

	pdf.page_count.times do |i|
	  pdf.go_to_page(i+1)
	  pdf.text "#{(i+1)}/#{pdf.page_count}", :size => 8, :align => :right
	end 
end