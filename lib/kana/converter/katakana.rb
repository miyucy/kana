# -*- coding: utf-8 -*-
# 全角カタカナ -> 半角カタカナ
Kana::Converter::KATAKANA = Hash[*{# 清音
                                   0x30A1 => 0xFF67, # KATAKANA LETTER SMALL A
                                   0x30A2 => 0xFF71, # KATAKANA LETTER A
                                   0x30A3 => 0xFF68, # KATAKANA LETTER SMALL I
                                   0x30A4 => 0xFF72, # KATAKANA LETTER I
                                   0x30A5 => 0xFF69, # KATAKANA LETTER SMALL U
                                   0x30A6 => 0xFF73, # KATAKANA LETTER U
                                   0x30A7 => 0xFF6A, # KATAKANA LETTER SMALL E
                                   0x30A8 => 0xFF74, # KATAKANA LETTER E
                                   0x30A9 => 0xFF6B, # KATAKANA LETTER SMALL O
                                   0x30AA => 0xFF75, # KATAKANA LETTER O
                                   0x30AB => 0xFF76, # KATAKANA LETTER KA
                                   0x30AD => 0xFF77, # KATAKANA LETTER KI
                                   0x30AF => 0xFF78, # KATAKANA LETTER KU
                                   0x30B1 => 0xFF79, # KATAKANA LETTER KE
                                   0x30B3 => 0xFF7A, # KATAKANA LETTER KO
                                   0x30B5 => 0xFF7B, # KATAKANA LETTER SA
                                   0x30B7 => 0xFF7C, # KATAKANA LETTER SI
                                   0x30B9 => 0xFF7D, # KATAKANA LETTER SU
                                   0x30BB => 0xFF7E, # KATAKANA LETTER SE
                                   0x30BD => 0xFF7F, # KATAKANA LETTER SO
                                   0x30BF => 0xFF80, # KATAKANA LETTER TA
                                   0x30C1 => 0xFF81, # KATAKANA LETTER TI
                                   0x30C3 => 0xFF6F, # KATAKANA LETTER SMALL TU
                                   0x30C4 => 0xFF82, # KATAKANA LETTER TU
                                   0x30C6 => 0xFF83, # KATAKANA LETTER TE
                                   0x30C8 => 0xFF84, # KATAKANA LETTER TO
                                   0x30CA => 0xFF85, # KATAKANA LETTER NA
                                   0x30CB => 0xFF86, # KATAKANA LETTER NI
                                   0x30CC => 0xFF87, # KATAKANA LETTER NU
                                   0x30CD => 0xFF88, # KATAKANA LETTER NE
                                   0x30CE => 0xFF89, # KATAKANA LETTER NO
                                   0x30CF => 0xFF8A, # KATAKANA LETTER HA
                                   0x30D2 => 0xFF8B, # KATAKANA LETTER HI
                                   0x30D5 => 0xFF8C, # KATAKANA LETTER HU
                                   0x30D8 => 0xFF8D, # KATAKANA LETTER HE
                                   0x30DB => 0xFF8E, # KATAKANA LETTER HO
                                   0x30DE => 0xFF8F, # KATAKANA LETTER MA
                                   0x30DF => 0xFF90, # KATAKANA LETTER MI
                                   0x30E0 => 0xFF91, # KATAKANA LETTER MU
                                   0x30E1 => 0xFF92, # KATAKANA LETTER ME
                                   0x30E2 => 0xFF93, # KATAKANA LETTER MO
                                   0x30E3 => 0xFF6C, # KATAKANA LETTER SMALL YA
                                   0x30E4 => 0xFF94, # KATAKANA LETTER YA
                                   0x30E5 => 0xFF6D, # KATAKANA LETTER SMALL YU
                                   0x30E6 => 0xFF95, # KATAKANA LETTER YU
                                   0x30E7 => 0xFF6E, # KATAKANA LETTER SMALL YO
                                   0x30E8 => 0xFF96, # KATAKANA LETTER YO
                                   0x30E9 => 0xFF97, # KATAKANA LETTER RA
                                   0x30EA => 0xFF98, # KATAKANA LETTER RI
                                   0x30EB => 0xFF99, # KATAKANA LETTER RU
                                   0x30EC => 0xFF9A, # KATAKANA LETTER RE
                                   0x30ED => 0xFF9B, # KATAKANA LETTER RO
                                   0x30EF => 0xFF9C, # KATAKANA LETTER WA
                                   0x30F2 => 0xFF66, # KATAKANA LETTER WO
                                   0x30F3 => 0xFF9D, # KATAKANA LETTER N
                                   # 記号
                                   0x3001 => 0xFF64, # Ideographic Comma
                                   0x3002 => 0xFF61, # Ideographic Full Stop
                                   0x300C => 0xFF62, # Left Corner Bracket
                                   0x300D => 0xFF63, # Right Corner Bracket
                                   0x30FC => 0xFF70, # KATAKANA-HIRAGANA PROLONGED SOUND MARK
                                   0x30FB => 0xFF65, # KATAKANA MIDDLE DOT
                                   0x3099 => 0xFF9E, # Combining Katakana Voiced Sound Mark
                                   0x309A => 0xFF9F, # Combining Katakana Semi-Voiced Sound Mark
                                 }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]

# 全角カタカナ -> 半角カタカナ
Kana::Converter::KATAKANA_DAKUON = Hash[*{# 濁音
                                          0x30F4 => [0xFF73,0xFF9E], # KATAKANA LETTER VU
                                          0x30AC => [0xFF76,0xFF9E], # KATAKANA LETTER GA
                                          0x30AE => [0xFF77,0xFF9E], # KATAKANA LETTER GI
                                          0x30B0 => [0xFF78,0xFF9E], # KATAKANA LETTER GU
                                          0x30B2 => [0xFF79,0xFF9E], # KATAKANA LETTER GE
                                          0x30B4 => [0xFF7A,0xFF9E], # KATAKANA LETTER GO
                                          0x30B6 => [0xFF7B,0xFF9E], # KATAKANA LETTER ZA
                                          0x30B8 => [0xFF7C,0xFF9E], # KATAKANA LETTER ZI
                                          0x30BA => [0xFF7D,0xFF9E], # KATAKANA LETTER ZU
                                          0x30BC => [0xFF7E,0xFF9E], # KATAKANA LETTER ZE
                                          0x30BE => [0xFF7F,0xFF9E], # KATAKANA LETTER ZO
                                          0x30C0 => [0xFF80,0xFF9E], # KATAKANA LETTER DA
                                          0x30C2 => [0xFF81,0xFF9E], # KATAKANA LETTER DI
                                          0x30C5 => [0xFF82,0xFF9E], # KATAKANA LETTER DU
                                          0x30C7 => [0xFF83,0xFF9E], # KATAKANA LETTER DE
                                          0x30C9 => [0xFF84,0xFF9E], # KATAKANA LETTER DO
                                          0x30D0 => [0xFF8A,0xFF9E], # KATAKANA LETTER BA
                                          0x30D3 => [0xFF8B,0xFF9E], # KATAKANA LETTER BI
                                          0x30D6 => [0xFF8C,0xFF9E], # KATAKANA LETTER BU
                                          0x30D9 => [0xFF8D,0xFF9E], # KATAKANA LETTER BE
                                          0x30DC => [0xFF8E,0xFF9E], # KATAKANA LETTER BO
                                          # 半濁音
                                          0x30D1 => [0xFF8A,0xFF9F], # KATAKANA LETTER PA
                                          0x30D4 => [0xFF8B,0xFF9F], # KATAKANA LETTER PI
                                          0x30D7 => [0xFF8C,0xFF9F], # KATAKANA LETTER PU
                                          0x30DA => [0xFF8D,0xFF9F], # KATAKANA LETTER PE
                                          0x30DD => [0xFF8E,0xFF9F], # KATAKANA LETTER PO
                                        }.map{ |k,v| [[k].pack('U'), v.map{ |e| [e].pack('U') }.join ] }.flatten]

# 特殊ケース
# 半角(半)濁点は U+3099、U+309A ではなく U+309B、U+309C に戻す
Kana::Converter::KATAKANA_INVERT = Hash[*{0xFF9E => 0x309B, # KATAKANA-HIRAGANA VOICED SOUND MARK
                                          0xFF9F => 0x309C, # KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
                                        }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]

Kana::Converter::KATAKANA_ZENHAN = Hash[*{
                                          0x309B => 0xFF9E,
                                          0x309C => 0xFF9F,
                                          0x30EE => 0xFF9C,
                                          0x30F0 => 0xFF72,
                                          0x30F1 => 0xFF74,
                                        }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]
