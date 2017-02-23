#未完成、終了判定を作っていないので×ボタンで消す必要がある

#座標の仮指定（上から数えたものを@tate 左から数えたものを@yokoとする）
@tate,@yoko,@step,@exam,@turn = 1,1,0,0,0

#初期配列
@array = [["　","１","２","３","４","５","６","７","８","　"],
["１","無","無","無","無","無","無","無","無","　"],
["２","無","無","無","無","無","無","無","無","　"],
["３","無","無","無","無","無","無","無","無","　"],
["４","無","無","無","●","○","無","無","無","　"],
["５","無","無","無","○","●","無","無","無","　"],
["６","無","無","無","無","無","無","無","無","　"],
["７","無","無","無","無","無","無","無","無","　"],
["８","無","無","無","無","無","無","無","無","　"],
["　","　","　","　","　","　","　","　","　","　"]
]

#盤面表示メソッド
def open
 @tate = 0
   10.times do
    @yoko = 0
      10.times do
        print @array[@tate][@yoko]
        @yoko += 1
      end
    print "\n"
    @tate += 1
  end
 @tate = 1 #（周囲８マス検索できるように、初期位置を1,1にしておく）
 @yoko = 1
end

#変換メソッドの数字は5を基準とした方向を表す
#変換メソッド4
def change_white_4
 if @array[@tate][@yoko-1] == "●"
  while @array[@tate][@yoko-1] == "●"do
  @step += 1
  @yoko -= 1
  end
    if @array[@tate][@yoko-1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @yoko += 1
     end
    else
         @step.times do
         @yoko +=1
         end
    end
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end

#変換メソッド6
def change_white_6

 if @array[@tate][@yoko+1] == "●"
  while @array[@tate][@yoko+1] == "●"do
  @step += 1
  @yoko += 1
  end

    if @array[@tate][@yoko+1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @yoko -= 1
     end
    else
         @step.times do
         @yoko -=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end

#変換メソッド2
def change_white_2

 if @array[@tate+1][@yoko] == "●"
  while @array[@tate+1][@yoko] == "●"do
  @step += 1
  @tate += 1
  end

    if @array[@tate+1][@yoko] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate -= 1
     end
    else
         @step.times do
         @tate -=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end

#変換メソッド8
def change_white_8

 if @array[@tate-11][@yoko] == "●"
  while @array[@tate-1][@yoko] == "●"do
  @step += 1
  @tate -= 1
  end

    if @array[@tate-1][@yoko] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate += 1
     end
    else
         @step.times do
         @tate +=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end

#変換メソッド7
def change_white_7

 if @array[@tate-1][@yoko-1] == "●"
  while @array[@tate-1][@yoko-1] == "●"do
  @step += 1
  @tate -= 1
  @yoko -= 1
  end

    if @array[@tate-1][@yoko-1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate += 1
     @yoko += 1
     end
    else
         @step.times do
         @tate += 1
         @yoko += 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end



#変換メソッド9
def change_white_9

 if @array[@tate-1][@yoko+1] == "●"
  while @array[@tate-1][@yoko+1] == "●"do
  @step += 1
  @tate -= 1
  @yoko += 1
  end

    if @array[@tate-1][@yoko+1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate += 1
     @yoko -= 1
     end
    else
         @step.times do
         @tate += 1
         @yoko -= 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end

#変換メソッド1
def change_white_1

 if @array[@tate+1][@yoko-1] == "●"
  while @array[@tate+1][@yoko-1] == "●"do
  @step += 1
  @tate += 1
  @yoko -= 1
  end

    if @array[@tate+1][@yoko-1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate -= 1
     @yoko += 1
     end
    else
         @step.times do
         @tate -= 1
         @yoko += 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end


#変換メソッド3
def change_white_3

 if @array[@tate+1][@yoko+1] == "●"
  while @array[@tate+1][@yoko+1] == "●"do
  @step += 1
  @tate += 1
  @yoko += 1
  end

    if @array[@tate+1][@yoko+1] == "○"
     @step.times do
     @array[@tate][@yoko] = "○"
     @exam += 1
     @tate -= 1
     @yoko -= 1
     end
    else
         @step.times do
         @tate -= 1
         @yoko -= 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "○"
end


#変換メソッド4
def change_black_4

 if @array[@tate][@yoko-1] == "○"
  while @array[@tate][@yoko-1] == "○"do
  @step += 1
  @yoko -= 1
  end

    if @array[@tate][@yoko-1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @yoko += 1
     end
    else
         @step.times do
         @yoko +=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end

#変換メソッド6
def change_black_6

 if @array[@tate][@yoko+1] == "○"
  while @array[@tate][@yoko+1] == "○"do
  @step += 1
  @yoko += 1
  end

    if @array[@tate][@yoko+1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @yoko -= 1
     end
    else
         @step.times do
         @yoko -=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end

#変換メソッド2
def change_black_2

 if @array[@tate+1][@yoko] == "○"
  while @array[@tate+1][@yoko] == "○"do
  @step += 1
  @tate += 1
  end

    if @array[@tate+1][@yoko] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate -= 1
     end
    else
         @step.times do
         @tate -=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end

#変換メソッド8
def change_black_8

 if @array[@tate-11][@yoko] == "○"
  while @array[@tate-1][@yoko] == "○"do
  @step += 1
  @tate -= 1
  end

    if @array[@tate-1][@yoko] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate += 1
     end
    else
         @step.times do
         @tate +=1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end

#変換メソッド7
def change_black_7

 if @array[@tate-1][@yoko-1] == "○"
  while @array[@tate-1][@yoko-1] == "○"do
  @step += 1
  @tate -= 1
  @yoko -= 1
  end

    if @array[@tate-1][@yoko-1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate += 1
     @yoko += 1
     end
    else
         @step.times do
         @tate += 1
         @yoko += 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end



#変換メソッド9
def change_black_9

 if @array[@tate-1][@yoko+1] == "○"
  while @array[@tate-1][@yoko+1] == "○"do
  @step += 1
  @tate -= 1
  @yoko += 1
  end

    if @array[@tate-1][@yoko+1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate += 1
     @yoko -= 1
     end
    else
         @step.times do
         @tate += 1
         @yoko -= 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end



#変換メソッド1
def change_black_1

 if @array[@tate+1][@yoko-1] == "○"
  while @array[@tate+1][@yoko-1] == "○"do
  @step += 1
  @tate += 1
  @yoko -= 1
  end

    if @array[@tate+1][@yoko-1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate -= 1
     @yoko += 1
     end
    else
         @step.times do
         @tate -= 1
         @yoko += 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end


#変換メソッド3
def change_black_3

 if @array[@tate+1][@yoko+1] == "○"
  while @array[@tate+1][@yoko+1] == "○"do
  @step += 1
  @tate += 1
  @yoko += 1
  end

    if @array[@tate+1][@yoko+1] == "●"
     @step.times do
     @array[@tate][@yoko] = "●"
     @exam += 1
     @tate -= 1
     @yoko -= 1
     end
    else
         @step.times do
         @tate -= 1
         @yoko -= 1
         end
    end
 
 else
 end
@step = 0
@array[@tate][@yoko] = "●"
end


#入力受付メソッド（黒番）
def turn_black
 puts "黒番です。座標ｘｙを指定してください。（左からx番目、上からy番目）"
 input = gets.chomp.delete(" ").slice(0,2).split("")
 @yoko = input[0].to_i
 @tate = input[1].to_i
  until (@array[@tate][@yoko] == "無")do
   puts "入力は無効です。再度入力してください。"
   input = gets.chomp.delete(" ").slice(0,2).split("")
   @yoko = input[0].to_i
   @tate = input[1].to_i
  end
change_white_1
change_white_2
change_white_3
change_white_4
change_white_6
change_white_7
change_white_8
change_white_9

  if @exam >= 1
  @array[@tate][@yoko] = "○"
  @turn = 1
  elsif @exam == 0
  @array[@tate][@yoko] = "無"
  @turn = 0
  else
  @array[@tate][@yoko] = "無"
  @turn = 0
  end
@exam = 0
open  #盤面表示メソッド
end


#入力受付メソッド（白番）
def turn_white
 puts "白番です。座標ｘｙを指定してください。（左からx番目、上からy番目）"
 input = gets.chomp.delete(" ").slice(0,2).split("")
 @yoko = input[0].to_i
 @tate = input[1].to_i
  until (@array[@tate][@yoko] == "無")do
   puts "入力は無効です。再度入力してください。"
   input = gets.chomp.delete(" ").slice(0,2).split("")
   @yoko = input[0].to_i
   @tate = input[1].to_i
  end
change_black_1
change_black_2
change_black_3
change_black_4
change_black_6
change_black_7
change_black_8
change_black_9

  if @exam >= 1
  @array[@tate][@yoko] = "●"
  @turn = 0
  elsif @exam == 0
  @array[@tate][@yoko] = "無"
  @turn = 1
  else
  @array[@tate][@yoko] = "無"
  @turn = 1
  end
@exam = 0
 open  #盤面表示メソッド使用

end


#オセロ開始画面
puts "●＝白、○＝黒、先手番は黒です。"
open

until @turn == 2 do
 while @turn == 0 do
 turn_black
 end

 while @turn == 1 do
 turn_white
 end

end

open

=begin
if @array.count("●") > @array.count("○")
puts "黒の勝利！"

elsif @array.count("●") < @array.count("○")
puts "白の勝利！"

elsif @array.count("●") == @array.count("○")
puts "引き分け！"
else
puts "エラー"
end

=end