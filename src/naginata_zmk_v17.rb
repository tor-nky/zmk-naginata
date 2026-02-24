# v17

tanda = <<ETANDA
  |き|て|し|{←}|{→}|{BS}|る|す|へ|@|[  |
ろ|け|と|か|っ  |く  |あ  |い|う|ー|:|]  |
ほ|ひ|は|こ|そ  |た  |な  |ん|ら|れ|\|
ETANDA

shifted = <<ESHIFTED
   |め|り |ね       |+{←}|+{→}|さ       |よ|え|ゆ|`|{{}|
 せ|み|に |ま       |ち   |や   |の       |も|つ|ふ|*|{}}|
 ほ|ひ|を |、{Enter}|ぬ   |お   |。{Enter}|む|わ|れ|_|
ESHIFTED

mode1l = <<MEND
^{End}    |／{改行}|/*ディ*/|^s      |・      ||||||||
……{改行}|『{改行}|？{改行}|「{改行}| ({改行}||||||||
――{改行}|』{改行}|！{改行}|」{改行}| ){改行}|||||||
MEND

mode1r = <<MEND
                                     |||||{Home}      |+{End}{BS}|{vk1Csc079}|{Del}  |+{Esc 3}|  |  |
                                     |||||{Enter}{End}|{↑}      |+{↑}      |+{↑ 7}|^i      |  |  |
                                     |||||{End}       |{↓}      |+{↓}      |+{↓ 7}|^u      |  |
MEND

mode2l = <<MEND
｜{改行}|　　　×　　　×　　　×{改行 2}|{Home}{→}{End}{Del 2}{←}|{Home}{改行}{Space 1}{←}|〇{改行} ||||||||
《{改行}|【{改行}                        |{Home}{→}{End}{Del 4}{←}|{Home}{改行}{Space 3}{←}|{Space 3}||||||||
》{改行}|】{改行}                        |」{改行}{改行}            |」{改行}{改行}「{改行}   |」{改行}{改行}{Space}|||||||
MEND

mode2r = <<MEND
                                     |||||+{Home}|^x     |{vk1Csc079}|^v          |^z     |  |  |
                                     |||||^c     | {←}  | {→}      |+{← 7}     |+{→ 7}|  |  |
                                     |||||+{End} |+{←}  |+{→}      |{End}+{Home}|^y|  |
MEND

koyul = <<MEND
         |狂天寺    |          |詩織      |          ||||||||
水村     |弥勒      |トシ      |上條      |          ||||||||
         |ヒロシ    |          |          |          ||||||||
MEND

koyur = <<MEND
|||||          |          |      　  |          |ユカ      |          |          |
|||||          |悪魔      |          |          |          |          |
|||||田中      |          |          |          |          |          |
MEND

eiji    = %w(Q W E R T  Y U I O P  A S D F G  H J K L SEMI  Z X C V B  N M COMMA DOT SLASH)
eiji_r  = %w(Y U I O P  H J K L SEMI N M COMMA DOT SLASH)
eiji_l  = %w(Q W E R T  A S D F G  Z X C V B)

tanda = tanda.split("|").map{|c| c.strip}
tanda.delete_at(35)
tanda.delete_at(34)
tanda.delete_at(23)
tanda.delete_at(22)
tanda.delete_at(11)
tanda.delete_at(10)

shifted = shifted.split("|").map{|c| c.strip}
shifted.delete_at(35)
shifted.delete_at(34)
shifted.delete_at(23)
shifted.delete_at(22)
shifted.delete_at(11)
shifted.delete_at(10)

kana      = %w(あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や ゆ よ ら り る れ ろ わ を ん ー)
r_kana    = %w(a i u e o ka ki ku ke ko sa si su se so ta ti tu te to na ni nu ne no ha hi hu he ho ma mi mu me mo ya yu yo ra ri ru re ro wa wo nn -)

daku      = %w(が ぎ ぐ げ ご ざ じ ず ぜ ぞ だ ぢ づ で ど ば び ぶ べ ぼ ゔ)
r_daku    = %w(ga gi gu ge go za zi zu ze zo da di du de do ba bi bu be bo vu)
t_daku    = %w(か き く け こ さ し す せ そ た ち つ て と は ひ ふ へ ほ う)

handaku   = %w(ぱ ぴ ぷ ぺ ぽ)
t_handaku = %w(は ひ ふ へ ほ)
r_handaku = %w(pa pi pu pe po)

kogaki    = %w(ゃ ゅ ょ ぁ ぃ ぅ ぇ ぉ ゎ っ ヶ ヵ)
t_kogaki  = %w(や ゆ よ あ い う え お わ っ け か)
r_kogaki  = %w(xya xyu xyo xa xi xu xe xo xwa xtu xke xka)

kumiawase = []
r_kumiawase = []
kumiawase << %w(しゃ しゅ しょ じゃ じゅ じょ)
r_kumiawase << %w(sya syu syo zya zyu zyo)
kumiawase << %w(きゃ きゅ きょ ぎゃ ぎゅ ぎょ)
r_kumiawase << %w(kya kyu kyo gya gyu gyo)
kumiawase << %w(ちゃ ちゅ ちょ ぢゃ ぢゅ ぢょ)
r_kumiawase << %w(tya tyu tyo dya dyu dyo)
kumiawase << %w(にゃ にゅ にょ)
r_kumiawase << %w(nya nyu nyo)
kumiawase << %w(ひゃ ひゅ ひょ びゃ びゅ びょ ぴゃ ぴゅ ぴょ)
r_kumiawase << %w(hya hyu hyo bya byu byo pya pyu pyo)
kumiawase << %w(みゃ みゅ みょ)
r_kumiawase << %w(mya myu myo)
kumiawase << %w(りゃ りゅ りょ)
r_kumiawase << %w(rya ryu ryo)

gairai = []
r_gairai = []
gairai << %w(てぃ てゅ でぃ でゅ)
r_gairai << %w(thi texyu dhi dhu)
gairai << %w(とぅ どぅ)
r_gairai << %w(toxu doxu)
gairai << %w(しぇ ちぇ じぇ ぢぇ)
r_gairai << %w(sye tye zye dye)

gairai << %w(ふぁ ふぃ ふぇ ふぉ ふゅ)
r_gairai << %w(fa fi fe fo fyu)
gairai << %w(いぇ)
r_gairai << %w(ixe)
gairai << %w(うぃ うぇ うぉ ゔぁ ゔぃ ゔぇ ゔぉ ゔゅ)
r_gairai << %w(wi we uxo va vi ve vo vuxyu)
gairai << %w(くぁ くぃ くぇ くぉ くゎ ぐぁ ぐぃ ぐぇ ぐぉ ぐゎ)
r_gairai << %w(kuxa kuxi kuxe kuxo kuxwa guxa guxi guxe guxo guxwa)
# gairai << %w(つぁ つぃ つぇ つぉ)
# r_gairai << %w(tsa tsi tse tso)
gairai << %w(つぁ)
r_gairai << %w(tsa)

kumiawase.flatten!
r_kumiawase.flatten!
gairai.flatten!
r_gairai.flatten!

def teigi(a, b, c, prefix="NONE", suffix="")
  _a = [a].flatten.map{|k| "B_" + k}.join("|")
  _b = b.ljust(6, "_").split('').join(', ').upcase().gsub('_', 'NONE')
  sprintf("  {.shift = %-8s, .douji = %-15s, .kana = {%-31s}, .func = nofunc }, // #{c}", prefix, _a, _b)
end

puts "  // 清音"
kana.each_with_index do |k, i|
  j = tanda.index(k)
  if j && j >= 0
    puts teigi(eiji[j], r_kana[i], k)
  end
  j = shifted.index(k)
  if j && j >= 0
    puts teigi(eiji[j], r_kana[i], k, "B_SPACE")
  end
end

puts
puts "  // 濁音"
daku.each_with_index do |k, i|
  j = tanda.index(t_daku[i]) || shifted.index(t_daku[i])
  if j && j >= 0
    if eiji_r.index(eiji[j])
      puts teigi(["F"] + [eiji[j]], r_daku[i], k, "0UL")
    else
      puts teigi(["J"] + [eiji[j]], r_daku[i], k)
    end
  end
end

puts
puts "  // 半濁音"
handaku.each_with_index do |k, i|
  j = tanda.index(t_handaku[i]) || shifted.index(t_handaku[i])
  if j && j >= 0
    if eiji_r.index(eiji[j])
      puts teigi(["V"] + [eiji[j]], r_daku[i], k)
    else
      puts teigi(["M"] + [eiji[j]], r_daku[i], k)
    end
  end
end

puts
puts "  // 小書き"
kogaki.each_with_index do |k, i|
  j = tanda.index(k)
  if j && j >= 0
    puts teigi(eiji[j], r_kogaki[i], k)
    next
  end
  j = shifted.index(k)
  if j && j >= 0
    puts teigi(eiji[j], r_kogaki[i], k, "B_SPACE")
    next
  end

  j = tanda.index(t_kogaki[i]) || shifted.index(t_kogaki[i])
  if j && j >= 0
    puts teigi(["Q"] + [eiji[j]], r_kogaki[i], k)
  end
end

puts
puts "  // 清音拗音 濁音拗音 半濁拗音"
kumiawase.each_with_index do |k, i|
  j = tanda.index(k[0])
  if j && j >= 0
    e0 = eiji[j]
  end
  unless e0
    j = shifted.index(k[0])
    if j && j >= 0
      e0 = eiji[j]
    end
  end
  unless e0
    l = daku.index(k[0])
    if l && l >= 0
      j = tanda.index(t_daku[l]) || shifted.index(t_daku[l])
      if j && j >= 0
        if eiji_r.index(eiji[j])
          e0 = ["F", eiji[j]]
        else
          e0 = ["J", eiji[j]]
        end
      end
    end
  end
  unless e0
    l = handaku.index(k[0])
    if l && l >= 0
      j = tanda.index(t_handaku[l]) || shifted.index(t_handaku[l])
      if j && j >= 0
        if eiji_r.index(eiji[j])
          e0 = ["V", eiji[j]]
        else
          e0 = ["M", eiji[j]]
        end
      end
    end
  end

  l = kogaki.index(k[1])
  j = tanda.index(t_kogaki[l]) || shifted.index(t_kogaki[l])
  if j && j >= 0
    e1 = eiji[j]
    puts teigi([e0, e1], r_kumiawase[i], k)
    # puts teigi([e0, e1], r_kumiawase[i], k + "(冗長)", "", "|B_SPACE")
  end
end

puts
puts "  // 清音外来音 濁音外来音"
gairai.each_with_index do |k, i|
  j = tanda.index(k[0]) || shifted.index(k[0])
  if j && j >= 0
    if eiji_r.index(eiji[j])
      e0 = ["V", eiji[j]]
    else
      e0 = ["M", eiji[j]]
    end
  end
  unless e0
    l = daku.index(k[0])
    if l && l >= 0
      j = tanda.index(t_daku[l]) || shifted.index(t_daku[l])
      if j && j >= 0
        if eiji_r.index(eiji[j])
          e0 = ["F", eiji[j]]
        else
          e0 = ["J", eiji[j]]
        end
      end
    end
  end

  l = kogaki.index(k[1])
  j = tanda.index(t_kogaki[l]) || shifted.index(t_kogaki[l])
  if j && j >= 0
    e1 = eiji[j]
    puts teigi([e0, e1], r_gairai[i], k)
    # puts teigi([e0, e1], r_gairai[i], k + "(冗長)", "", "|B_SPACE")
  end
end


# 編集モード

$henshu = {
  "+{End}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_end();", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{Home}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_home();", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{← 20}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_left(20);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{← 5}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_left(5);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{←}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_left(1);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{↑ 7}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_up(7);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{↑}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_up(1);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{→ 20}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_right(20);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{→ 5}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_right(5);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{→}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_right(1);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{↓ 7}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_down(7);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{↓}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_down(1);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "/*ディ*/" => [""],
  "^c" => ["ng_copy();"],
  "^i" => ["ng_katakana();"],
  "^s" => ["ng_save();"],
  "^u" => ["ng_hiragana();"],
  "^v" => ["ng_paste();"],
  "^x" => ["ng_cut();"],
  "^y" => ["ng_redo();"],
  "^z" => ["ng_undo();"],
  "^{End}" => ["ng_eof();"],
  "{BS}" => ["raise_zmk_keycode_state_changed_from_encoded(BSPC, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(BSPC, false, timestamp);"],
  "{Del 1}" => ["raise_zmk_keycode_state_changed_from_encoded(DELETE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(DELETE, false, timestamp);"],
  "{Del 2}" => ["raise_zmk_keycode_state_changed_from_encoded(DELETE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(DELETE, false, timestamp);"] * 2,
  "{Del 3}" => ["raise_zmk_keycode_state_changed_from_encoded(DELETE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(DELETE, false, timestamp);"] * 3,
  "{Del 4}" => ["raise_zmk_keycode_state_changed_from_encoded(DELETE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(DELETE, false, timestamp);"] * 4,
  "{Del}" => ["raise_zmk_keycode_state_changed_from_encoded(DELETE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(DELETE, false, timestamp);"],
  "{End}" => ["ng_end();"],
  "{Enter}" => ["raise_zmk_keycode_state_changed_from_encoded(ENTER, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ENTER, false, timestamp);"],
  "{Esc 3}" => ["raise_zmk_keycode_state_changed_from_encoded(ESC, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ESC, false, timestamp);"] * 3,
  "{Home}" => ["ng_home();"],
  "{Space 1}" => ["raise_zmk_keycode_state_changed_from_encoded(SPACE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(SPACE, false, timestamp);"],
  "{Space 3}" => ["raise_zmk_keycode_state_changed_from_encoded(SPACE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(SPACE, false, timestamp);"] * 3,
  "{Space}" => ["raise_zmk_keycode_state_changed_from_encoded(SPACE, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(SPACE, false, timestamp);"],
  "{vk1Csc079}" => ["ng_saihenkan();"], # 再変換
  "{← 5}" => ["ng_left(5);"],
  "{←}" => ["ng_left(1);"],
  "{↑}" => ["ng_up(1);"],
  "{→ 5}" => ["ng_right(5);"],
  "{→}" => ["ng_right(1);"],
  "{↓}" => ["ng_down(1);"],
  "{改行 2}" => ["raise_zmk_keycode_state_changed_from_encoded(ENTER, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ENTER, false, timestamp);"] * 2,
  "{改行}" => ["raise_zmk_keycode_state_changed_from_encoded(ENTER, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ENTER, false, timestamp);"],
  "+{Esc 2}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ESC, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ESC, false, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ESC, true, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(ESC, false, timestamp);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{← 7}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_left(7);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
  "+{→ 7}" => ["raise_zmk_keycode_state_changed_from_encoded(LSHIFT, true, timestamp);", "ng_right(7);", "raise_zmk_keycode_state_changed_from_encoded(LSHIFT, false, timestamp);"],
 }
 
qwerty    = %w(Q W E R T  Y U I O P NO NO A S D F G  H J K L SCLN NO NO Z X C V B  N M COMM DOT SLSH NO)

mode1l = mode1l.split("|").map{|x| x.strip}
mode1r = mode1r.split("|").map{|x| x.strip}
mode2l = mode2l.split("|").map{|x| x.strip}
mode2r = mode2r.split("|").map{|x| x.strip}


$hcase = []
$hkey = []

def str2hex(str)
  result = []
  str.each_char do |char|
    result << char.ord.to_s(16).upcase.rjust(4, '0')
  end
  result
end

def outputHenshu(pk, m, k)
  $hcase << "void ngh_#{pk.gsub(/\|*B_/, "")+k}() { // #{m}"
  v = m.scan(/((?:\^?\+?{.+?})|(?:\^.)|(?:[^{}\^\+]+))/).flatten
  d = []
  uc = false
  v.each do |i|
    if $henshu.key? i
      if i == "{改行}" && uc
        uc = false
        next
      end
      d << $henshu[i]
    else
      uhex = str2hex(i)
      uhex.each do |u|
        ks = u.chars.map do |k|
          if ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].index(k)
            k = 'N' + k
          else
            k
          end
        end
        d << "input_unicode_hex(#{ks[0]}, #{ks[1]}, #{ks[2]}, #{ks[3]});"
      end
      uc = true
    end
  end
  $hcase += d.flatten.map{|x| "    #{x}"}
  $hcase << "}\n\n"
  $hkey << sprintf("  {.shift = %-10s , .douji = B_%-5s , .kana = {NONE, NONE, NONE, NONE, NONE, NONE} , .func = ngh_%-6s }, // #{m}", pk, k, pk.gsub(/\|*B_/, "")+k)
end

qwerty.each_with_index do |k, i|
  m =  mode1l[i]
  pk = "B_J|B_K"
  outputHenshu(pk, m, k) unless m == ""
end

qwerty.each_with_index do |k, i|
  m =  mode1r[i]
  pk = "B_D|B_F"
  outputHenshu(pk, m, k) unless m == ""
end

qwerty.each_with_index do |k, i|
  m =  mode2l[i]
  pk = "B_M|B_COMM"
  outputHenshu(pk, m, k) unless m == ""
end

qwerty.each_with_index do |k, i|
  m =  mode2r[i]
  pk = "B_C|B_V"
  outputHenshu(pk, m, k) unless m == ""
end

puts "// 編集モード"
puts $hkey
puts $hcase

$hkey = []
$hcase = []

koyul = koyul.split("|").map{|x| x.strip}
koyur = koyur.split("|").map{|x| x.strip}

qwerty.each_with_index do |k, i|
  m =  koyul[i]
  pk = "B_U|B_I"
  outputHenshu(pk, m, k) unless m == ""
end

qwerty.each_with_index do |k, i|
  m =  koyur[i]
  pk = "B_E|B_R"
  outputHenshu(pk, m, k) unless m == ""
end


puts "// 固有名詞"
puts $hkey
puts $hcase