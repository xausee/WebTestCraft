#encoding: utf-8
require 'csv'

module Cucumber
  module Core
    module Gherkin
      class Parser

        def parse_test_data file
          data = ""
          full_path = Dir.pwd + '/features/test_data/'+file
          CSV.open(full_path, "r").each_with_index do |row, index|
            if index != 0
              data += "|"+row.join('|')+"|\n"
            end
          end
          data
        end

        def set_test_data(document)
          e = f = false
          document.body.each_line do |r|
            if r.lstrip.start_with?('Examples:')
              e = true
            end

            if e && r.lstrip.start_with?('|')
              f = true
            end

            if e && f && r.lstrip.start_with?('Data:')
              file = r.gsub('Data:',"").strip
              data = parse_test_data(file)
              document.body.gsub!(r, data)
              e = f = false
            end
          end
        end

        def document(document)
          set_test_data document

          parser  = ::Gherkin3::Parser.new
          scanner = ::Gherkin3::TokenScanner.new(document.body)
          core_builder = AstBuilder.new(document.uri)

          if document.body.strip.empty?
            return receiver.feature Ast::NullFeature.new
          end

          begin
            result = parser.parse(scanner)
            receiver.feature core_builder.feature(result)
          rescue *PARSER_ERRORS => e
            raise Core::Gherkin::ParseError.new("#{document.uri}: #{e.message}")
          end
        end

      end
    end
  end
end
