# -*- coding: utf-8 -*-
module Kana
  module Converter
    require 'kana/converter/numeric_alphabet'
    require 'kana/converter/katahira'
    require 'kana/converter/zenkaku'

    def convert str, opt='KV'
      opt ||= 'KV'
      regexp, table = build_convert_table opt
      str.gsub(regexp) do |match|
        table[match]
      end
    end
    module_function :convert

    @@cached_data = {}

    def self.build_convert_table opt
      opt = parse_option opt
      return @@cached_data[opt] if @@cached_data[opt]
      table = convert_tables opt
      @@cached_data[opt] = [build_regexp(table), table].freeze
    end

    VALID_OPTION = ['n','N','r','R','s','S','a','A','k','K','h','H','c','C','V',].freeze

    def self.parse_option opt
      opt.split(//).uniq.sort.each do |c|
        raise ArgumentError unless VALID_OPTION.include?(c)
      end
    end

    def self.convert_tables opt
      table = {}
      opt.each do |c|
        case c
        when 'n'
          # 全角数字 -> 半角数字
          table.update NUMERIC
        when 'N'
          # 半角数字 -> 全角数字
          table.update NUMERIC.invert
        when 'r'
          # 全角英字 -> 半角英字
          table.update ALPHABET
        when 'R'
          # 半角英字 -> 全角英字
          table.update ALPHABET.invert
        when 's'
          # 全角スペース -> 半角スペース
          table.update SPACE
        when 'S'
          # 半角スペース -> 全角スペース
          table.update SPACE.invert
        when 'a'
          # 全角英数字 -> 半角英数字
          table.update convert_tables(['n','r',])
          table.update SYMBOL
        when 'A'
          # 半角英数字 -> 全角英数字
          table.update convert_tables(['N','R',])
          table.update SYMBOL.invert
          table.update SYMBOL_INVERT
        when 'k'
          # 全角カタカナ -> 半角カタカナ
          table.update ZENKAKU_KATAKANA_HANKAKU
          table.update ZENKAKU_DAKUTEN_KATAKANA_HANKAKU
          table.update ZENKAKU_SYMBOL
        when 'K'
          # 全角カタカナ -> 半角カタカナ
          table.update ZENKAKU_KATAKANA_HANKAKU.invert
          table.update ZENKAKU_DAKUTEN_KATAKANA_HANKAKU.invert if opt.find{ |o| o == 'V' }
          table.update ZENKAKU_SYMBOL.invert
          table.update ZENKAKU_KATAKANA_SYMBOL.invert
        when 'h'
          # 全角ひらがな -> 半角カタカナ
          table.update ZENKAKU_HIRAGANA_HANKAKU
          table.update ZENKAKU_DAKUTEN_HIRAGANA_HANKAKU
          table.update ZENKAKU_SYMBOL
        when 'H'
          # 半角カタカナ -> 全角ひらがな
          table.update ZENKAKU_HIRAGANA_HANKAKU.invert
          table.update ZENKAKU_DAKUTEN_HIRAGANA_HANKAKU.invert if opt.find{ |o| o == 'V' }
          table.update ZENKAKU_SYMBOL.invert
          table.update ZENKAKU_HIRAGANA_SYMBOL.invert
        when 'c'
          # 全角カタカナ -> 全角ひらがな
          table.update KATAHIRA
        when 'C'
          # 全角ひらがな -> 全角カタカナ
          table.update KATAHIRA.invert
        when 'V'
          # do nothing
        else
          raise ArgumentError
        end
      end
      table.freeze
    end

    def self.build_regexp table
      Regexp.union(*table.keys.sort_by{ |k| -table[k].size }.map{ |v|
                     if RUBY_VERSION >= '1.9.1'
                       Regexp.new(Regexp.escape(v))
                     else
                       Regexp.new(Regexp.escape(v,'u'),nil,'u')
                     end
                   }).freeze
    end
  end
end
