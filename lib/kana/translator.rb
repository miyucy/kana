# -*- coding: utf-8 -*-
module Kana
  module Translator

    if RUBY_VERSION >= '1.9.1'
      require 'kana/translator/engine/encoding'
      include Engine::Encoding
    else
      require 'kana/translator/engine/nkf'
      include Engine::Nkf
    end

    module_function :to_utf8, :to_encode, :support?
  end
end
