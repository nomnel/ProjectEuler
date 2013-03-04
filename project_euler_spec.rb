files = Dir.glob("#{File.join(__dir__, '..')}/*.rb")
files.each { |f| require f }
main = self

describe 'ProjectEuler' do
  files.each do |file|
    name = "e#{File.basename(file, '.rb')}"
    it name do
      main.send(name).should eq main.send("#{name}_answer")
    end
  end
end