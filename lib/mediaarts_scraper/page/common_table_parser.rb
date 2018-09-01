module MediaartsScraper
  module Page
    module CommonTableParser
      KEY_SEPARATOR = "/"

      def parse_common_key_value_table(table)
        result = {}

        table.xpath("tbody/tr").each do |tr|
          ths = tr.xpath("th")
          tds = tr.xpath("td")

          if ths.count == tds.count
            keys = ths.map(&:text).map(&:strip)

            values = tds.each_with_index.map do |td, i|
              if td.xpath("p").count == 1
                dls = td.xpath("div/div/dl")

                if dls.count > 0
                  dls.each do |dl|
                    dts = dl.xpath("dt").map(&:text).map(&:strip)
                    dds = dl.xpath("dd").map(&:text).map(&:strip)

                    if dts.count == dds.count
                      dts.each do |dt|
                        dds.each do |dd|
                          result[keys[i] + KEY_SEPARATOR + dt] = dd
                        end
                      end
                    else
                      raise ParseError
                    end
                  end
                end

                td.xpath("p").first.text.strip
              else
                td.text.strip
              end
            end

            keys.each_with_index do |key, i|
              result[key] = values[i]
            end
          else
            raise ParseError
          end
        end

        result
      end

      def parse_common_serial_rows_table(table)
        header = table.xpath("thead/tr/th").map(&:text).map(&:strip)

        table.xpath("tbody/tr").map do |tr|
          tds = tr.xpath("td")

          data = tds.map { |td|
            child = td.child

            if child
              child.text.strip
            else
              td.text.strip
            end
          }

          tr_result = Hash[*header.zip(data).flatten]

          link_element = tds.detect { |td| td.xpath("a").first }
          tr_result["href"] = link_element.xpath("a").first.attributes["href"].value if link_element

          tr_result
        end
      end
    end
  end
end
