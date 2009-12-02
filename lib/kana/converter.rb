# -*- coding: utf-8 -*-
module Kana
  module Converter
    require 'kana/converter/numeric_alphabet'
    require 'kana/converter/katahira'
    require 'kana/converter/zenkaku'

    def convert str, opt='KV'
      opt ||= 'KV'
      table = convert_tables opt
      str.gsub(build_regexp(table)) do |match|
        table[match]
      end
    end
    module_function :convert

    def self.build_regexp table
      Regexp.union(*table.keys.sort_by{ |k| -table[k].size }.map{ |v|
                     if RUBY_VERSION >= '1.9.1'
                       Regexp.new(Regexp.escape(v))
                     else
                       Regexp.new(Regexp.escape(v,'u'),nil,'u')
                     end
                   })
    end

    def self.convert_table_katakana_hiragana opt, vsm
      table = {}
      opt.split(//).each do |c|
        case c
        when 'k'
          # k 	「全角カタカナ」を「半角カタカナ」に変換します。
          table.update ZENKAKU_KATAKANA_HANKAKU
          table.update ZENKAKU_DAKUTEN_KATAKANA_HANKAKU
          table.update ZENKAKU_SYMBOL
        when 'K'
          # K 	「半角カタカナ」を「全角カタカナ」に変換します。
          table.update ZENKAKU_KATAKANA_HANKAKU.invert
          table.update ZENKAKU_DAKUTEN_KATAKANA_HANKAKU.invert if vsm
          table.update ZENKAKU_SYMBOL.invert
          table.update ZENKAKU_KATAKANA_SYMBOL.invert
        when 'h'
          # h 	「全角ひらがな」を「半角カタカナ」に変換します。
          table.update ZENKAKU_HIRAGANA_HANKAKU
          table.update ZENKAKU_DAKUTEN_HIRAGANA_HANKAKU
          table.update ZENKAKU_SYMBOL
        when 'H'
          # H 	「半角カタカナ」を「全角ひらがな」に変換します。
          table.update ZENKAKU_HIRAGANA_HANKAKU.invert
          table.update ZENKAKU_DAKUTEN_HIRAGANA_HANKAKU.invert if vsm
          table.update ZENKAKU_SYMBOL.invert
          table.update ZENKAKU_HIRAGANA_SYMBOL.invert
        when 'c'
          # c 	「全角カタカナ」を「全角ひらがな」に変換します。
          table.update KATAHIRA
        when 'C'
          # C 	「全角ひらがな」を「全角カタカナ」に変換します。
          table.update KATAHIRA.invert
        end
      end
      table
    end

    ZENKATA_FLAG = 0x01 # Zenkaku Katakana
    ZENHIRA_FLAG = 0x02 # Zenkaku Hiragana
    HANKATA_FLAG = 0x04 # Hankaku Katakana
    VSM_FLAG     = 0x08 # Voiced Sound Mark

    def self.convert_tables opt
      table = {}
      kh_option = {:flag => '', :vsm => false, :input => 0}
      opt.split(//).each do |c|
        case c
        when 'n'
          table.update NUMERIC
        when 'N'
          table.update NUMERIC.invert
        when 'r'
          table.update ALPHABET
        when 'R'
          table.update ALPHABET.invert
        when 's'
          table.update SPACE
        when 'S'
          table.update SPACE.invert
        when 'a'
          table.update convert_tables('nr')
          table.update SYMBOL
        when 'A'
          table.update convert_tables('NR')
          table.update SYMBOL.invert
          table.update SYMBOL_INVERT

        when 'k'
          raise ArgumentError if (kh_option[:input] & ZENKATA_FLAG) != 0
          kh_option[:input] |= ZENKATA_FLAG
          kh_option[:flag] += 'k'
        when 'c'
          raise ArgumentError if (kh_option[:input] & ZENKATA_FLAG) != 0
          kh_option[:input] |= ZENKATA_FLAG
          kh_option[:flag] += 'c'
        when 'h'
          raise ArgumentError if (kh_option[:input] & ZENHIRA_FLAG) != 0
          kh_option[:input] |= ZENHIRA_FLAG
          kh_option[:flag] += 'h'
        when 'C'
          raise ArgumentError if (kh_option[:input] & ZENHIRA_FLAG) != 0
          kh_option[:input] |= ZENHIRA_FLAG
          kh_option[:flag] += 'C'
        when 'K'
          raise ArgumentError if (kh_option[:input] & HANKATA_FLAG) != 0
          kh_option[:input] |= HANKATA_FLAG
          kh_option[:flag] += 'K'
        when 'H'
          raise ArgumentError if (kh_option[:input] & HANKATA_FLAG) != 0
          kh_option[:input] |= HANKATA_FLAG
          kh_option[:flag] += 'H'
        when 'V'
          raise ArgumentError if (kh_option[:input] & HANKATA_FLAG) == 0
          kh_option[:vsm] = true
        else
          raise ArgumentError
        end
      end
      table.update convert_table_katakana_hiragana kh_option[:flag], kh_option[:vsm]
    end
  end
end
