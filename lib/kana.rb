# -*- coding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
require 'kana/translator'
require 'kana/converter'

module Kana
  def kana(str, opt=nil, enc=nil)
    return str unless Translator.support?(str, enc)
    str, orig_enc = Translator.to_utf8(str, enc)
    str = Converter.convert(str, opt)
    Translator.to_encode(str, orig_enc)
  end
  module_function :kana
end

class String
  def kana(opt=nil, enc=nil)
    Kana.kana self, opt, enc
  end
end
