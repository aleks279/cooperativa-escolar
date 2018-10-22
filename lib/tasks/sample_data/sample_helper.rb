class SampleHelper
  class << self
    def image(name)
      path = Pathname.new(Rails.root) + "app/assets/images/#{name}"
      File.open(path) if File.exist?(path)
    end
  end
end
