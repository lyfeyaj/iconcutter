require 'optparse'
require 'iconcutter'

module IconCutter
  class Cli
    def self.run(args)
      options = {}

      OptionParser.new do |opts|
        platforms = IconCutter::Versions::PLATFORMS

        opts.banner = <<-USAGE
Usage: iconcutter [options] your_image_file_path
USAGE
        opts.on('-p', '--platform x,y,z', Array, "Specify app plaform: #{platforms.join(',')}") do |v|
          new_v = v.map(&:downcase)
          if !((platforms | v) - platforms).empty?
            puts "'#{v.join(',')}' is not a vaild platform, only `#{PLATFORMS.join(',')}` can be specified"
            exit
          end
          options[:platform] = new_v
        end

        opts.on('-o', '--out [DIR]', String, 'output icons directory') do |v|
          options[:out] = v
        end

        opts.on_tail('-h', '--help', 'Show this message') do
          puts opts
          exit
        end
      end.parse!(args)

      IconCutter::Cutter.process(args[0], options)
    end
  end
end
