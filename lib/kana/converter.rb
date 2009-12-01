# -*- coding: utf-8 -*-
module Kana
  module Converter
    %w(NUMERIC ALPHABET SYMBOL SYMBOL_INVERT SPACE).each do |const|
      autoload const, 'kana/converter/numeric_alphabet'
    end
    %w(KATAKANA KATAKANA_DAKUON KATAKANA_INVERT KATAKANA_ZENHAN).each do |const|
      autoload const, 'kana/converter/katakana'
    end
    %w(HIRAGANA HIRAGANA_DAKUON HIRAGANA_INVERT).each do |const|
      autoload const, 'kana/converter/hiragana'
    end
    autoload :KATAHIRA, 'kana/converter/katahira'

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
          table.update KATAKANA
          table.update KATAKANA_ZENHAN
          table.update KATAKANA_DAKUON
        when 'K'
          # K 	「半角カタカナ」を「全角カタカナ」に変換します。
          if vsm
            table.update KATAKANA.invert
            table.update KATAKANA_DAKUON.invert
            table.update KATAKANA_INVERT
          else
            table.update KATAKANA.invert
            table.update KATAKANA_INVERT
          end
        when 'h'
          # h 	「全角ひらがな」を「半角カタカナ」に変換します。
          table.update HIRAGANA
          table.update HIRAGANA_DAKUON
        when 'H'
          # H 	「半角カタカナ」を「全角ひらがな」に変換します。
          table.update HIRAGANA.invert
          table.update HIRAGANA_INVERT
          table.update HIRAGANA_DAKUON.invert if vsm
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
