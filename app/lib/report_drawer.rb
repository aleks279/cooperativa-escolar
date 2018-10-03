class ReportDrawer
	def self.draw(orders)
		pdf = PDF::Writer.new
		pdf.text "Hola Todos"
		pdf.render
	end
end