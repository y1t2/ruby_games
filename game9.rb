# 始からレーザーを敵に当てるとクリア(入力 a:左 s:下 d:右 w:上)
# @map[]を編集するだけで、別のステージも作れる

@map = [
"壁","壁","壁","壁","壁","壁","壁",
"壁","／","□","／","□","＼","壁",
"壁","□","敵","□","＼","□","壁",
"壁","□","□","□","□","□","壁",
"壁","／","□","始","□","／","壁",
"壁","□","＼","□","□","＼","壁",
"壁","□","□","＼","□","＼","壁",
"壁","＼","／","□","＼","／","壁",
"壁","壁","壁","壁","壁","壁","壁"
]

# 設定 @pは始の位置
@p = 31
@total=0
@score=0
@n=1
@a="□"
@b="／"
@c="＼"
@d="■"
@e="敵"
@f="壁"

# マップを開く
def open
 @i=0
  9.times do
   7.times do
    print @map[@i]
    @i+=1
   end
   print "\n"
  end
 print "\n"
end

# 右に動く
def right
 @p+=1
 @a="□"
 @b="／"
 @c="＼"
 @d="■"
 puts @map[@p]
 @total+=1
end

# 下に動く
def down
 @p+=7
 @a="＼"
 @b="■"
 @c="□"
 @d="／"
 puts @map[@p]
 @total+=1
end

# 上に動く
def up
 @p-=7
 @a="／"
 @b="□"
 @c="■"
 @d="＼"
 puts @map[@p]
 @total+=1
end

# 左に動く
def left
 @p-=1
 @a="■"
 @b="＼"
 @c="／"
 @d="□"
 puts @map[@p]
 @total+=1
end

# 開始画面
open
puts "進む方向を入力してください(上=w,下=s,左=a,右=d)"
until (@OK==1)do
@answer = gets.chomp.slice(0).to_s
 if (@answer=="a")
   left
   @OK=1
 elsif (@answer=="s")
   down
   @OK=1
 elsif (@answer=="d")
   right
   @OK=1
 elsif (@answer=="w")
   up
   @OK=1
 end
end

# ゲーム終了条件を満たすまで進み続ける
while(@n==1)do
  if(@map[@p]=="#{@a}")
    right
  elsif(@map[@p]=="#{@b}")
    up
  elsif(@map[@p]=="#{@c}")
    down
  elsif(@map[@p]=="#{@d}")
    left
  end
 if(@map[@p]=="敵")
   @n=0
   @score+=1
 elsif(@map[@p]=="壁"||@map[@p]=="始")
   @n=0
 end
 if(@total>=20)
   @n=0
 end
end

# 結果の表示
puts "Total:#{@total}\n"
if (@score>=1)
  puts "COMPLETED!"
else
  puts "GAME OVER"
end
