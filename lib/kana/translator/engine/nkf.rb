require 'nkf'

module Kana::Translator::Engine
  module Nkf
    SYM_ENC = {
      :sjis  => NKF::SJIS,
      :eucjp => NKF::EUC,
      :utf8  => NKF::UTF8,
      :utf16 => NKF::UTF16,
    }
    ENC_OPT = {
      NKF::SJIS  => '-S',
      NKF::EUC   => '-E',
      NKF::UTF8  => '-W',
      NKF::UTF16 => '-W16',
    }
    DEC_OPT = {
        NKF::SJIS  => '-s',
        NKF::EUC   => '-e',
        NKF::UTF8  => '-w',
        NKF::UTF16 => '-w16',
    }

    def to_utf8(str, original_encoding=nil)
      original_encoding = SYM_ENC[original_encoding] || original_encoding
      original_encoding ||= NKF.guess(str)
      if original_encoding != NKF::UTF8
        opt = ['-m0', '-x', '-w']
        opt << ENC_OPT[original_encoding]
        str = NKF.nkf(opt.join(' '), str)
      end
      [str, original_encoding]
    end

    def to_encode(str, original_encoding)
      return str if original_encoding == NKF::UTF8
      enc = DEC_OPT[original_encoding]
      raise ArgumentError unless enc
      opt = ['-m0', '-x', '-W', enc]
      NKF.nkf(opt.join(' '), str)
    end

    def support?(str, enc)
      ([NKF::SJIS, NKF::EUC, NKF::UTF8, NKF::UTF16].include?(SYM_ENC[enc]) or
       [NKF::SJIS, NKF::EUC, NKF::UTF8, NKF::UTF16].include?(NKF.guess(str)))
    end
  end
end
