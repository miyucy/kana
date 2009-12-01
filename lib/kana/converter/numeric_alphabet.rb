# -*- coding: utf-8 -*-
Kana::Converter::NUMERIC = Hash[*{0xFF10 => 0x30, # Fullwidth Digit Zero
                                  0xFF11 => 0x31, # Fullwidth Digit One
                                  0xFF12 => 0x32, # Fullwidth Digit Two
                                  0xFF13 => 0x33, # Fullwidth Digit Three
                                  0xFF14 => 0x34, # Fullwidth Digit Four
                                  0xFF15 => 0x35, # Fullwidth Digit Five
                                  0xFF16 => 0x36, # Fullwidth Digit Six
                                  0xFF17 => 0x37, # Fullwidth Digit Seven
                                  0xFF18 => 0x38, # Fullwidth Digit Eight
                                  0xFF19 => 0x39, # Fullwidth Digit Nine
                                }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]

Kana::Converter::ALPHABET = Hash[*{0xFF21 => 0x41, # Fullwidth Latin Capital Letter A
                                   0xFF22 => 0x42, # Fullwidth Latin Capital Letter B
                                   0xFF23 => 0x43, # Fullwidth Latin Capital Letter C
                                   0xFF24 => 0x44, # Fullwidth Latin Capital Letter D
                                   0xFF25 => 0x45, # Fullwidth Latin Capital Letter E
                                   0xFF26 => 0x46, # Fullwidth Latin Capital Letter F
                                   0xFF27 => 0x47, # Fullwidth Latin Capital Letter G
                                   0xFF28 => 0x48, # Fullwidth Latin Capital Letter H
                                   0xFF29 => 0x49, # Fullwidth Latin Capital Letter I
                                   0xFF2A => 0x4A, # Fullwidth Latin Capital Letter J
                                   0xFF2B => 0x4B, # Fullwidth Latin Capital Letter K
                                   0xFF2C => 0x4C, # Fullwidth Latin Capital Letter L
                                   0xFF2D => 0x4D, # Fullwidth Latin Capital Letter M
                                   0xFF2E => 0x4E, # Fullwidth Latin Capital Letter N
                                   0xFF2F => 0x4F, # Fullwidth Latin Capital Letter O
                                   0xFF30 => 0x50, # Fullwidth Latin Capital Letter P
                                   0xFF31 => 0x51, # Fullwidth Latin Capital Letter Q
                                   0xFF32 => 0x52, # Fullwidth Latin Capital Letter R
                                   0xFF33 => 0x53, # Fullwidth Latin Capital Letter S
                                   0xFF34 => 0x54, # Fullwidth Latin Capital Letter T
                                   0xFF35 => 0x55, # Fullwidth Latin Capital Letter U
                                   0xFF36 => 0x56, # Fullwidth Latin Capital Letter V
                                   0xFF37 => 0x57, # Fullwidth Latin Capital Letter W
                                   0xFF38 => 0x58, # Fullwidth Latin Capital Letter X
                                   0xFF39 => 0x59, # Fullwidth Latin Capital Letter Y
                                   0xFF3A => 0x5A, # Fullwidth Latin Capital Letter Z
                                   0xFF41 => 0x61, # Fullwidth Latin Small Letter A
                                   0xFF42 => 0x62, # Fullwidth Latin Small Letter B
                                   0xFF43 => 0x63, # Fullwidth Latin Small Letter C
                                   0xFF44 => 0x64, # Fullwidth Latin Small Letter D
                                   0xFF45 => 0x65, # Fullwidth Latin Small Letter E
                                   0xFF46 => 0x66, # Fullwidth Latin Small Letter F
                                   0xFF47 => 0x67, # Fullwidth Latin Small Letter G
                                   0xFF48 => 0x68, # Fullwidth Latin Small Letter H
                                   0xFF49 => 0x69, # Fullwidth Latin Small Letter I
                                   0xFF4A => 0x6A, # Fullwidth Latin Small Letter J
                                   0xFF4B => 0x6B, # Fullwidth Latin Small Letter K
                                   0xFF4C => 0x6C, # Fullwidth Latin Small Letter L
                                   0xFF4D => 0x6D, # Fullwidth Latin Small Letter M
                                   0xFF4E => 0x6E, # Fullwidth Latin Small Letter N
                                   0xFF4F => 0x6F, # Fullwidth Latin Small Letter O
                                   0xFF50 => 0x70, # Fullwidth Latin Small Letter P
                                   0xFF51 => 0x71, # Fullwidth Latin Small Letter Q
                                   0xFF52 => 0x72, # Fullwidth Latin Small Letter R
                                   0xFF53 => 0x73, # Fullwidth Latin Small Letter S
                                   0xFF54 => 0x74, # Fullwidth Latin Small Letter T
                                   0xFF55 => 0x75, # Fullwidth Latin Small Letter U
                                   0xFF56 => 0x76, # Fullwidth Latin Small Letter V
                                   0xFF57 => 0x77, # Fullwidth Latin Small Letter W
                                   0xFF58 => 0x78, # Fullwidth Latin Small Letter X
                                   0xFF59 => 0x79, # Fullwidth Latin Small Letter Y
                                   0xFF5A => 0x7A, # Fullwidth Latin Small Letter Z
                                 }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]

Kana::Converter::SYMBOL = Hash[*{0xFF01 => 0x21, # Fullwidth Exclamation Mark
                                 0xFF02 => 0x22, # Fullwidth Quotation Mark
                                 0xFF03 => 0x23, # Fullwidth Number Sign
                                 0xFF04 => 0x24, # Fullwidth Dollar Sign
                                 0xFF05 => 0x25, # Fullwidth Percent Sign
                                 0xFF06 => 0x26, # Fullwidth Ampersand
                                 0xFF07 => 0x27, # Fullwidth Apostrophe
                                 0xFF08 => 0x28, # Fullwidth Left Parenthesis
                                 0xFF09 => 0x29, # Fullwidth Right Parenthesis
                                 0xFF0A => 0x2A, # Fullwidth Asterisk
                                 0xFF0B => 0x2B, # Fullwidth Plus Sign
                                 0xFF0C => 0x2C, # Fullwidth Comma
                                 0xFF0D => 0x2D, # Fullwidth Hyphen-Minus
                                 0xFF0E => 0x2E, # Fullwidth Full Stop
                                 0xFF0F => 0x2F, # Fullwidth Solidus
                                 0xFF1A => 0x3A, # Fullwidth Colon
                                 0xFF1B => 0x3B, # Fullwidth Semicolon
                                 0xFF1C => 0x3C, # Fullwidth Less-Than Sign
                                 0xFF1D => 0x3D, # Fullwidth Equals Sign
                                 0xFF1E => 0x3E, # Fullwidth Greater-Than Sign
                                 0xFF1F => 0x3F, # Fullwidth Question Mark
                                 0xFF20 => 0x40, # Fullwidth Commercial At
                                 0xFF5B => 0x7B, # Fullwidth Left Curly Bracket
                                 0xFF5C => 0x7C, # Fullwidth Vertical Line
                                 0xFF5D => 0x7D, # Fullwidth Right Curly Bracket
                                 0xFF5E => 0x7E, # Fullwidth Tilde
                                 0xFF5F => 0x2985, # Fullwidth Left White Parenthesis
                                 0xFF60 => 0x2986, # Fullwidth Right White Parenthesis
                                 0xFFE0 => 0xA2, # Fullwidth Cent Sign
                                 0xFFE1 => 0xA3, # Fullwidth Pound Sign
                                 0xFFE2 => 0xAC, # Fullwidth Not Sign
                                 0xFFE3 => 0xAF, # Fullwidth Macron
                                 0xFFE4 => 0xA6, # Fullwidth Broken Bar
                                 0xFFE5 => 0xA5, # Fullwidth Yen Sign
                                 0xFFE6 => 0x20A9, # Fullwidth Won Sign
                               }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]

Kana::Converter::SPACE = Hash[*{0x3000 => 0x20, # IDEOGRAPHIC SPACE
                              }.map{ |k,v| [[k].pack('U'), [v].pack('U')] }.flatten]
