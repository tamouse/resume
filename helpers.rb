require 'yaml'
require 'erb'

module FrankHelpers

  class Resume

    attr_accessor :data

    def initialize(yaml="resume.yml")
      @data = YAML.load(ERB.new(File.read(yaml)).result)
    end

  end

end
