# -*- coding: utf-8 -*-
module Kana
  module Converter
    def convert str, opt=nil
      str.gsub(/０|ａ|ア|Ａ/) do |match|
        case match
        when '０'
          '0'
        when 'ａ'
          'a'
        when 'Ａ'
          'A'
        when 'ア'
          'ｱ'
        end
      end
    end
    module_function :convert
  end
end
