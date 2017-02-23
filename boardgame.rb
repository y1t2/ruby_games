=begin
＜4人用ボードゲーム＞
金貨を一番多く手に入れたプレイヤーが優勝(6ターンでゲーム終了)
サイコロの出目が3つ表示され、1つを選択して進む
[踏んだマスが自分の色と同じ]もしくは[宝マス]の場合、金貨が多くもらえる(1Pは赤、2Pは青、3Pは緑、4Pは黄)
選択肢4を選択すると、金貨を消費して特技が使える
敵マスにぶつかると戦いが始まり、勝利すると大金を入手し、全プレイヤーを初期位置に戻す

補足:
ステージはランダム生成
敵ステータスは自分以外のプレイヤーの平均値
選ばなかった出目は自プレイヤーのステータス強化に使われる
=end

#ステージ設定
@warp_4 = Random.rand(3)+1
@position_1,@position_2,@position_3,@position_4 = 0,0,0,0
@stage = []
@stage.push("始")
20.times do
 area = Random.rand(5)+1
 if (area==1)
   @stage.push("赤")
 elsif (area==2)
   @stage.push("青")
 elsif (area==3)
   @stage.push("緑")
 elsif (area==4)
   @stage.push("黄")
 elsif (area==5)
   @stage.push("宝")
 end
end
6.times do
@stage.push("敵")
end

#ステージ表示
def open_stage
 @i=0
 22.times do
 print "#{@stage[@i]}"
 @i+=1
 end
 print "\n"
 @position_1.times do
 print "  "
 end
 print "①１２３４５６\n"
 @position_2.times do
 print "  "
 end
 print "②１２３４５６\n"
 @position_3.times do
 print "  "
 end
 print "③１２３４５６\n"
 @position_4.times do
 print "  "
 end
 print "④１２３４５６\n"
 @i=0
 22.times do
 print "#{@stage[@i]}"
 @i+=1
 end
 print "\n----------------------\n"
end

#ステータス設定
@HP_1,@POWER_1,@GUARD_1,@GOLD_1 = 100,20,10,10
@HP_2,@POWER_2,@GUARD_2,@GOLD_2 = 100,20,10,10
@HP_3,@POWER_3,@GUARD_3,@GOLD_3 = 100,20,10,10
@HP_4,@POWER_4,@GUARD_4,@GOLD_4 = 100,20,10,10

#ステータス表示
def open
 print "①:","HP：#{@HP_1} 攻：#{@POWER_1} 防：#{@GUARD_1} 金：#{@GOLD_1}\n"
 print "②:","HP：#{@HP_2} 攻：#{@POWER_2} 防：#{@GUARD_2} 金：#{@GOLD_2}\n"
 print "③:","HP：#{@HP_3} 攻：#{@POWER_3} 防：#{@GUARD_3} 金：#{@GOLD_3}\n"
 print "④:","HP：#{@HP_4} 攻：#{@POWER_4} 防：#{@GUARD_4} 金：#{@GOLD_4}\n"
end

#player1
def turn_1
 @a_1 = Random.rand(6)+1
 @b_1 = Random.rand(6)+1
 @c_1 = Random.rand(6)+1
 puts "プレイヤー１の手番です。１～３を選択","１.#{@a_1}マス進む","２.#{@b_1}マス進む","３.#{@c_1}マス進む","４.6マス進む＆全ステータス6増加(金貨2消費)"
def select_1
 print "#{@a_1}マス進む "
 @position_1 += @a_1
  if (@b_1 >= @c_1)
  puts "攻撃力#{@b_1}UP! 守備力#{@c_1}UP!\n"
  @POWER_1 += @b_1
  @GUARD_1 += @c_1
  end
  if (@b_1 < @c_1)
  puts "攻撃力#{@c_1}UP! 守備力#{@b_1}UP!\n"
  @POWER_1 += @c_1
  @GUARD_1 += @b_1
  end
open
end
def select_2
 print "#{@b_1}マス進む "
  @position_1 += @b_1
  if (@a_1 >= @c_1)
  puts "攻撃力#{@a_1}UP! 守備力#{@c_1}UP!"
  @POWER_1 += @a_1
  @GUARD_1 += @c_1
  end
  if (@a_1 < @c_1)
  puts "攻撃力#{@c_1}UP! 守備力#{@a_1}UP!"
  @POWER_1 += @c_1
  @GUARD_1 += @a_1
  end
open
end
def select_3
 print "#{@c_1}マス進む "
  @position_1 += @c_1
  if (@a_1 >= @b_1)
  puts "攻撃力#{@a_1}UP! 守備力#{@b_1}UP!"
  @POWER_1 += @a_1
  @GUARD_1 += @b_1
  end
  if (@a_1 < @b_1)
  puts "攻撃力#{@b_1}UP! 守備力#{@a_1}UP!"
  @POWER_1 += @b_1
  @GUARD_1 += @a_1
  end
open
end

def select_4
 puts "全ステータス6UP!"
 @POWER_1 += 6
 @GUARD_1 += 6
 @HP_1 += 6
 @GOLD_1 -= 2
 @position_1 += 6
open
end
  select = gets.slice(0,1).to_i
  select_1 if select == 1
  select_2 if select == 2
  select_3 if select == 3
  select_4 if select == 4
end


#player2
def turn_2
 @a_2 = Random.rand(6)+1
 @b_2 = Random.rand(6)+1
 @c_2 = Random.rand(6)+1
 puts "プレイヤー２の手番です。１～３を選択","１.#{@a_2}マス進む","２.#{@b_2}マス進む","３.#{@c_2}マス進む"
def select_1
 print "#{@a_2}マス進む "
  @position_2 += @a_2
  if (@b_2 >= @c_2)
  puts "攻撃力#{@b_2}UP! 守備力#{@c_2}UP!\n"
  @POWER_2 += @b_2
  @GUARD_2 += @c_2
  end
  if (@b_2 < @c_2)
  puts "攻撃力#{@c_2}UP! 守備力#{@b_2}UP!"
  @POWER_2 += @c_2
  @GUARD_2 += @b_2
  end
open
end
def select_2
 print "#{@b_2}マス進む "
  @position_2 += @b_2
  if (@a_2 >= @c_2)
  puts "攻撃力#{@a_2}UP! 守備力#{@c_2}UP!"
  @POWER_2 += @a_2
  @GUARD_2 += @c_2
  end
  if (@a_2 < @c_2)
  puts "攻撃力#{@c_2}UP! 守備力#{@a_2}UP!"
  @POWER_1 += @c_2
  @GUARD_1 += @a_2
  end
open
end
def select_3
print "#{@c_2}マス進む "
  @position_2 += @c_2
  if (@a_2 >= @b_2)
  puts "攻撃力#{@a_2}UP! 守備力#{@b_2}UP!"
  @POWER_2 += @a_2
  @GUARD_2 += @b_2
  end
  if (@a_2 < @b_2)
  puts "攻撃力#{@b_2}UP! 守備力#{@a_2}UP!"
  @POWER_2 += @b_2
  @GUARD_2 += @a_2
  end
open
end
  select = gets.slice(0,1).to_i
  select_1 if select == 1
  select_2 if select == 2
  select_3 if select == 3
end


#player3
def turn_3
 @a_3 = Random.rand(6)+1
 @b_3 = Random.rand(6)+1
 @c_3 = Random.rand(6)+1
 puts "プレイヤー３の手番です。１～３を選択","１.#{@a_3}マス進む","２.#{@b_3}マス進む","３.#{@c_3}マス進む","４.1マス進み力を強める"
def select_1
print "#{@a_3}マス進む "
  @position_3 += @a_3
  if (@b_3 >= @c_3)
  puts "攻撃力#{@b_3}UP! 守備力#{@c_3}UP!\n"
  @POWER_3 += @b_3
  @GUARD_3 += @c_3
  end
  if (@b_3 < @c_3)
  puts "攻撃力#{@c_3}UP! 守備力#{@b_3}UP!"
  @POWER_3 += @c_3
  @GUARD_3 += @b_3
  end
open
end

def select_2
 print "#{@b_3}マス進む "
  @position_3 += @b_3
  if (@a_3 >= @c_3)
  puts "攻撃力#{@a_3}UP! 守備力#{@c_3}UP!"
  @POWER_3 += @a_3
  @GUARD_3 += @c_3
  end
  if (@a_3 < @c_3)
  puts "攻撃力#{@c_3}UP! 守備力#{@a_3}UP!"
  @POWER_1 += @c_3
  @GUARD_1 += @a_3
  end
open
end

def select_3
 print "#{@c_3}マス進む "
  @position_3 += @c_3
  if (@a_3 >= @b_3)
  puts "攻撃力#{@a_3}UP! 守備力#{@b_3}UP!"
  @POWER_3 += @a_3
  @GUARD_3 += @b_3
  end
  if (@a_3 < @b_3)
  puts "攻撃力#{@b_3}UP! 守備力#{@a_3}UP!"
  @POWER_3 += @b_3
  @GUARD_3 += @a_3
  end
open
end
def select_4
 print "攻撃力9UP!\n"
 @POWER_3 += 9
 @position_3 += 1
open
end
  select = gets.slice(0,1).to_i
  select_1 if select == 1
  select_2 if select == 2
  select_3 if select == 3
  select_4 if select == 4
end


#player4
def turn_4
 @a_4 = Random.rand(6)+1
 @b_4 = Random.rand(6)+1
 @c_4 = Random.rand(6)+1
 puts "プレイヤー４の手番です。１～３を選択","１.#{@a_4}マス進む","２.#{@b_4}マス進む","３.#{@c_4}マス進む","４.誰かと位置交換(金貨１消費)"
def select_1
 print "#{@a_4}マス進む "
  @position_4 += @a_4
  if (@b_4 >= @c_4)
  puts "攻撃力#{@b_4}UP! 守備力#{@c_4}UP!\n"
  @POWER_4 += @b_4
  @GUARD_4 += @c_4
  end
  if (@b_4 < @c_4)
  puts "攻撃力#{@c_4}UP! 守備力#{@b_4}UP!"
  @POWER_4 += @c_4
  @GUARD_4 += @b_4
  end
open
end
def select_2
 print "#{@b_4}マス進む "
  @position_4 += @b_4
  if (@a_4 >= @c_4)
  puts "攻撃力#{@a_4}UP! 守備力#{@c_4}UP!"
  @POWER_4 += @a_4
  @GUARD_4 += @c_4
  end
  if (@a_4 < @c_4)
  puts "攻撃力#{@c_4}UP! 守備力#{@a_4}UP!"
  @POWER_4 += @c_4
  @GUARD_4 += @a_4
  end
open
end
def select_3
 print "#{@c_4}マス進む "
  @position_4 += @c_4
  if (@a_4 >= @b_4)
  puts "攻撃力#{@a_4}UP! 守備力#{@b_4}UP!"
  @POWER_4 += @a_4
  @GUARD_4 += @b_4
  end
  if (@a_4 < @b_4)
  puts "攻撃力#{@b_4}UP! 守備力#{@a_4}UP!"
  @POWER_4 += @b_4
  @GUARD_4 += @a_4
  end
open
end

def select_4
 if (@warp_4 == 1)
 print "player1と交換"
 @kari = @position_4
 @position_4 = @position_1
 @position_1 = @kari
 end


 if (@warp_4 == 2)
 print "player2と交換"
 @kari = @position_4
 @position_4 = @position_2
 @position_2 = @kari
 end

 if (@warp_4 == 3)
 print "player3と交換"
 @kari = @position_4
 @position_4 = @position_3
 @position_3 = @kari
 end
@GOLD_4 -= 1
open
end
  select = gets.slice(0,1).to_i
  select_1 if select == 1
  select_2 if select == 2
  select_3 if select == 3
  select_4 if select == 4
end


#player1
def battle_1
 @HP_e = (@HP_2 + @HP_3 + @HP_4)/3
 @POWER_e = (@POWER_2 + @POWER_3 + @POWER_4)/3
 @GUARD_e = (@GUARD_2 + @GUARD_3 + @GUARD_4)/3
 @win = 0
 puts "自HP#{@HP_1} 敵HP#{@HP_e}"
def fight_1_e
 if (@GUARD_e >= @POWER_1)
 puts "ダメージを与えれなかった"
 elsif(@GUARD_e < @POWER_1)
 @HP_e -= (@POWER_1 - @GUARD_e)
 puts "#{@POWER_1 - @GUARD_e}ダメージ与えた"
 end
 if (@HP_e <= 0)
 puts "自HP#{@HP_1} 敵HP0"
 puts "勝ち！"
 @win += 1
 else
 puts "自HP#{@HP_1} 敵HP#{@HP_e}"
 sleep(3)
 fight_e_1
 end
end
def fight_e_1
 if (@GUARD_1 >= @POWER_e)
 puts "ダメージを受けなかった"
 elsif (@GUARD_1 < @POWER_e)
 @HP_1 -= (@POWER_e - @GUARD_1)
 puts "#{@POWER_e - @GUARD_1}ダメージ受けた"
 end
 if (@HP_1 <= 0)
 puts "自HP0 敵HP#{@HP_e}"
 puts "負け！"
 else
 puts "自HP#{@HP_1} 敵HP#{@HP_e}"
 sleep(3)
 fight_1_e
 end
end
fight_1_e
 if (@win >= 1)
 puts "金貨を10枚手に入れた！"
 @GOLD_1 += 10
 end
 @position_1 = 0
 @position_2 = 0
 @position_3 = 0
 @position_4 = 0
end


#player2
def battle_2
 @HP_e = (@HP_1 + @HP_3 + @HP_4)/3
 @POWER_e = (@POWER_1 + @POWER_3 + @POWER_4)/3
 @GUARD_e = (@GUARD_1 + @GUARD_3 + @GUARD_4)/3
 @win = 0
 puts "自HP#{@HP_2} 敵HP#{@HP_e}"
def fight_2_e
 if (@GUARD_e >= @POWER_2)
 puts "ダメージを与えれなかった"
 elsif(@GUARD_e < @POWER_2)
 @HP_e -= (@POWER_2 - @GUARD_e)
 puts "#{@POWER_2 - @GUARD_e}ダメージ与えた"
 end
 if (@HP_e <= 0)
 puts "自HP#{@HP_2} 敵HP0"
 puts "勝ち！"
 @win += 1
 else
 puts "自HP#{@HP_2} 敵HP#{@HP_e}"
 sleep(3)
 fight_e_2
 end
end
def fight_e_2
 if (@GUARD_2 >= @POWER_e)
 puts "ダメージを受けなかった"
 elsif (@GUARD_2 < @POWER_e)
 @HP_2 -= (@POWER_e - @GUARD_2)
 puts "#{@POWER_e - @GUARD_2}ダメージ受けた"
 end
 if (@HP_2 <= 0)
 puts "自HP0 敵HP#{@HP_e}"
 puts "負け！"
 else
 puts "自HP#{@HP_2} 敵HP#{@HP_e}"
 sleep(3)
 fight_2_e
 end
end
fight_2_e
 if (@win >= 1)
 puts "金貨を10枚手に入れた！"
 @GOLD_2 += 10
 end
 @position_1 = 0
 @position_2 = 0
 @position_3 = 0
 @position_4 = 0
end


#player3
def battle_3
 @HP_e = (@HP_1 + @HP_2 + @HP_4)/3
 @POWER_e = (@POWER_1 + @POWER_2 + @POWER_4)/3
 @GUARD_e = (@GUARD_1 + @GUARD_2 + @GUARD_4)/3
 @win = 0
 puts "自HP#{@HP_3} 敵HP#{@HP_e}"
def fight_3_e
 if (@GUARD_e >= @POWER_3)
 puts "ダメージを与えれなかった"
 elsif(@GUARD_e < @POWER_3)
 @HP_e -= (@POWER_3 - @GUARD_e)
 puts "#{@POWER_3 - @GUARD_e}ダメージ与えた"
 end
 if (@HP_e <= 0)
 puts "自HP#{@HP_3} 敵HP0"
 puts "勝ち！"
 @win += 1
 else
 puts "自HP#{@HP_3} 敵HP#{@HP_e}"
 sleep(3)
 fight_e_3
 end
end
def fight_e_3
 if (@GUARD_3 >= @POWER_e)
 puts "ダメージを受けなかった"
 elsif (@GUARD_3 < @POWER_e)
 @HP_3 -= (@POWER_e - @GUARD_3)
 puts "#{@POWER_e - @GUARD_3}ダメージ受けた"
 end
 if (@HP_3 <= 0)
 puts "自HP0 敵HP#{@HP_e}"
 puts "負け！"
 else
 puts "自HP#{@HP_3} 敵HP#{@HP_e}"
 sleep(3)
 fight_3_e
 end
end
fight_3_e
 if (@win >= 1)
 puts "金貨を10枚手に入れた！"
 @GOLD_3 += 10
 end
 @position_1 = 0
 @position_2 = 0
 @position_3 = 0
 @position_4 = 0
end


#player4
def battle_4
 @HP_e = (@HP_1 + @HP_2 + @HP_3)/3
 @POWER_e = (@POWER_1 + @POWER_2 + @POWER_3)/3
 @GUARD_e = (@GUARD_1 + @GUARD_2 + @GUARD_3)/3
 @win = 0
 puts "自HP#{@HP_4} 敵HP#{@HP_e}"
def fight_4_e
 if (@GUARD_e >= @POWER_4)
 puts "ダメージを与えれなかった"
 elsif(@GUARD_e < @POWER_4)
 @HP_e -= (@POWER_4 - @GUARD_e)
 puts "#{@POWER_4 - @GUARD_e}ダメージ与えた"
 end
 if (@HP_e <= 0)
 puts "自HP#{@HP_4} 敵HP0"
 puts "勝ち！"
 @win += 1
 else
 puts "自HP#{@HP_4} 敵HP#{@HP_e}"
 sleep(3)
 fight_e_4
 end
end
def fight_e_4
 if (@GUARD_4 >= @POWER_e)
 puts "ダメージを受けなかった"
 elsif (@GUARD_4 < @POWER_e)
 @HP_4 -= (@POWER_e - @GUARD_4)
 puts "#{@POWER_e - @GUARD_4}ダメージ受けた"
 end
 if (@HP_4 <= 0)
 puts "自HP0 敵HP#{@HP_e}"
 puts "負け！"
 else
 puts "自HP#{@HP_4} 敵HP#{@HP_e}"
 sleep(3)
 fight_4_e
 end
end
fight_4_e
 if (@win >= 1)
 puts "金貨を10枚手に入れた！"
 @GOLD_4 += 10
 end
 @position_1 = 0
 @position_2 = 0
 @position_3 = 0
 @position_4 = 0
end


#event1赤
def event_1
 if (@stage[@position_1] == "赤")
 puts "赤に到着。金貨3枚を手に入れた！HP10増加！"
 @GOLD_1 += 3
 @HP_1 += 10
 elsif (@stage[@position_1] == "青")
 puts "青に到着。金貨1枚を手に入れた！"
 @GOLD_1 += 1
 elsif (@stage[@position_1] == "緑")
 puts "緑に到着。金貨1枚を手に入れた！"
 @GOLD_1 += 1
 elsif (@stage[@position_1] == "黄")
 puts "黄に到着。金貨1枚を手に入れた！"
 @GOLD_1 += 1
 elsif (@stage[@position_1] == "敵")
 puts "敵に遭遇。勝負！"
 @stock = @HP_1
 battle_1
 @HP_1 = @stock
 elsif (@stage[@position_1] == "宝")
 puts "宝を発見。金貨を5枚手に入れた！"
 @GOLD_1 += 5
 end
end


#event2青
def event_2
 if (@stage[@position_2] == "赤")
 puts "赤に到着。金貨1枚を手に入れた！"
 @GOLD_2 += 1
 elsif (@stage[@position_2] == "青")
 puts "青に到着。金貨3枚を手に入れた！HP10増加！"
 @GOLD_2 += 3
 @HP_2 += 10
 elsif (@stage[@position_2] == "緑")
 puts "緑に到着。金貨1枚を手に入れた！"
 @GOLD_2 += 1
 elsif (@stage[@position_2] == "黄")
 puts "黄に到着。金貨1枚を手に入れた！"
 @GOLD_2 += 1
 elsif (@stage[@position_2] == "敵")
 puts "敵に遭遇。勝負！"
 @stock = @HP_2
 battle_2
 @HP_2 = @stock
 elsif (@stage[@position_2] == "宝")
 puts "宝を発見。金貨を5枚手に入れた！"
 @GOLD_2 += 5
 end
end


#event3緑
def event_3
 if (@stage[@position_3] == "赤")
 puts "赤に到着。金貨1枚を手に入れた！"
 @GOLD_3 += 1
 elsif (@stage[@position_3] == "青")
 puts "青に到着。金貨1枚を手に入れた！"
 @GOLD_3 += 1
 elsif (@stage[@position_3] == "緑")
 puts "緑に到着。金貨3枚を手に入れた！HP10増加！"
 @GOLD_3 += 3
 @HP_3 += 10
 elsif (@stage[@position_3] == "黄")
 puts "黄に到着。金貨1枚を手に入れた！"
 @GOLD_3 += 1
 elsif (@stage[@position_3] == "敵")
 puts "敵に遭遇。勝負！"
 @stock = @HP_3
 battle_3
 @HP_3 = @stock
 elsif (@stage[@position_3] == "宝")
 puts "宝を発見。金貨を5枚手に入れた！"
 @GOLD_3 += 5
 end
end


#event4黄
def event_4
 if (@stage[@position_4] == "赤")
 puts "赤に到着。金貨1枚を手に入れた！"
 @GOLD_4 += 1
 elsif (@stage[@position_4] == "青")
 puts "青に到着。金貨1枚を手に入れた！"
 @GOLD_4 += 1
 elsif (@stage[@position_4] == "緑")
 puts "緑に到着。金貨1枚を手に入れた！"
 @GOLD_4 += 1
 elsif (@stage[@position_4] == "黄")
 puts "黄に到着。金貨3枚を手に入れた！HP10増加！"
 @GOLD_4 += 3
 @HP_4 += 10
 elsif (@stage[@position_4] == "敵")
 puts "敵に遭遇。勝負！"
 @stock = @HP_4
 battle_4
 @HP_4 = @stock
 elsif (@stage[@position_4] == "宝")
 puts "宝を発見。金貨を5枚手に入れた！"
 @GOLD_4 += 5
 end
end


open_stage

6.times do
turn_1
event_1
open_stage

turn_2
event_2
open_stage

turn_3
event_3
open_stage

turn_4
event_4
open_stage
end


puts "ゲーム終了\n"

score_1 = @GOLD_1*10+1
score_2 = @GOLD_2*10+2
score_3 = @GOLD_3*10+3
score_4 = @GOLD_4*10+4

array = [score_1,score_2,score_3,score_4].sort!

no_1 = array[3].to_s
s_1 = (no_1.size)-1

no_2 = array[2].to_s
s_2 = (no_2.size)-1

no_3 = array[1].to_s
s_3 = (no_3.size)-1

no_4 = array[0].to_s
s_4 = (no_4.size)-1

puts "１位：player#{no_1.slice(s_1, 1)} #{no_1.chop}枚"
puts "２位：player#{no_2.slice(s_2, 1)} #{no_2.chop}枚"
puts "３位：player#{no_3.slice(s_3, 1)} #{no_3.chop}枚"
puts "４位：player#{no_4.slice(s_4, 1)} #{no_4.chop}枚"
