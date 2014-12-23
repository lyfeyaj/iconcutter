module IconCutter
  class Cutter
    class << self
      attr_accessor :image_file, :options

      # Process image as icons
      def process(filepath, args)
        @image_file = filepath
        @options = args
        check_if_imagemagick_exist?
        check_file_exist?
        parse_options
        crop_image_for @options[:platform]
      end

      private

      # Check `imagemagick exists`
      def check_if_imagemagick_exist?
        if !system('which convert')
          puts 'Image Magick is not installed on your system'
          exit
        end
      end

      # Check if source file's existance
      def check_file_exist?
        if @image_file.nil? || @image_file.empty?
          puts 'No image specified! You can use `--help` option to see the usage'
          exit
        end
        if !File.exist?(@image_file)
          puts "#{@image_file} is not exists"
          exit
        else
          @image_file = File.expand_path @image_file
        end
      end

      # Parse Options
      def parse_options
        @options[:out] ||= './IconCutterResult'
        @options[:out] = File.expand_path @options[:out]
        if !@options[:platform]
          @options[:platform] = ['all']
        end
        options[:platform] = IconCutter::Versions::PLATFORMS if options[:platform].include? 'all'
        if !Dir.exist?(@options[:out])
          puts "Output directory is not exists, creating one....#{@options[:out]}"
          system "mkdir -p #{@options[:out]}"
        end
        (@options[:platform] - ['all']).each do |dir|
          new_dir = File.join @options[:out], dir
          if !Dir.exist?(new_dir)
            system "mkdir -p #{new_dir}"
            puts "Creating sub-categories: #{dir}"
          end
        end
      end

      # Crop (Resize) image to specified platforms
      def crop_image_for(platforms)
        if platforms.include? 'all'
          crop_image_for(IconCutter::Versions::PLATFORMS - ['all'])
        else
          platforms.each do |p|
            p = p.upcase
            const_get("IconCutter::Versions::#{p}_VERSIONS").each do |version|
              v = version.join('x')
              output = output_file_by_version(v, p)
              print ">> Resizing #{p} version: #{v}".ljust(40)
              system "convert '#{image_file}' -resize #{v} '#{output}'"
              puts '   ... Done!'
            end
          end
        end
      end

      # Output files according to platform and version
      def output_file_by_version(version, platform)
        basename = File.basename(@image_file, '.*')
        extname = File.extname @image_file
        File.join @options[:out], platform.downcase, "#{basename}_#{version}#{extname}"
      end
    end
  end
end
