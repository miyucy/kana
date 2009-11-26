require 'nkf'

module Kana::Translator::Engine
  module Nkf
    def to_utf8(str, original_encoding=nil)
      opt = ['-m0', '-w']
      if original_encoding
        opt << { :sjis => '-S', :eucjp => '-E', :utf8 => '-W', :utf16 => '-W16', }[original_encoding]
      end
      [NKF.nkf(opt.join(' '), str), NKF.guess(str)]
    end

    def to_encode(str, original_encoding)
      enc = { NKF::SJIS => '-s', NKF::EUC => '-e', NKF::UTF8 => '-w', NKF::UTF16 => '-w16', }[original_encoding]
      raise ArgumentError unless enc
      opt = ['-m0', '-W', enc]
      NKF.nkf(opt.join(' '), str)
    end

    def support?(str, enc)
      [NKF::SJIS, NKF::EUC, NKF::UTF8, NKF::UTF16].include?(NKF.guess(str))
    end
  end
end
