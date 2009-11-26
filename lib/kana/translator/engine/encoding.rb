module Kana::Translator::Engine
  class Encoding
    def to_utf8(str, original_encoding=nil)
      [str.encode(Encoding::UTF_8), str.encoding]
    end

    def to_encocde(str, original_encoding)
      str.encode(original_encoding)
    end

    def support?(str,enc=nil)
      [Encoding::CP932,    Encoding::SJIS,
       Encoding::CP51932,  Encoding::EUCJP,
       Encoding::UTF_8,
       Encoding::UTF_16LE, Encoding::UTF_16BE,].include?(str.encoding)
    end
  end
end
