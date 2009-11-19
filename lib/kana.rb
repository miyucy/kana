# -*- coding: utf-8 -*-
require 'nkf'
module Kana
  def kana(string, option='')
    return string unless support_encoding?(string)

    string, encoding = to_utf8(string)
    translated = string.gsub(/０|ａ|Ａ|ア/) do |match|
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
    to_original_encoding(translated, encoding)
  end
  module_function :kana

  # 半角/全角変換するエンコーディングならばtrueを返す
  def self.support_encoding?(string)
    [NKF::SJIS, NKF::EUC, NKF::UTF8, NKF::UTF16,].include? NKF.guess(string)
  end

  # エンコーディングを判別して、UTF-8に変換したstringと元のエンコーディングを返す
  def self.to_utf8(string)
    encoding = NKF.guess(string)
    if need_encoding_convert?(string, encoding)
      mapping = { NKF::SJIS => '-S', NKF::EUC => '-E', NKF::UTF16 => '-W16', }[encoding]
      raise ArgumentError unless mapping
      string = NKF.nkf("-m0 -w8 #{mapping}", string)
    end
    [string, encoding]
  end

  # 元のエンコーディングencodingに戻したstringを返す
  def self.to_original_encoding(string, encoding)
    return string unless need_encoding_convert?(string, encoding)
    mapping = { NKF::SJIS => '-s', NKF::EUC => '-e', NKF::UTF16 => '-w16', }[encoding]
    raise ArgumentError unless mapping
    NKF.nkf("-m0 -W8 #{mapping}", string)
  end

  # UTF-8以外ならtrueを返す
  # TODO: 第1引数いらね
  # TODO: メソッドである必要あるか?
  def self.need_encoding_convert?(string, encoding)
    encoding != NKF::UTF8
  end
end
