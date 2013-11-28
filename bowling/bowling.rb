def score_for(balls)
  #balls += "----" #for the each_cons to got through all
  frames = (balls + "----").scan(/.{2}/)
  frames.each_cons(3).collect{ |frame| 
    frame_score(frame)
  }.inject(:+)
end

def frame_score(frames)
  return 10 + strike_bonus(frames[1..2]) if strike? frames[0][0]
  return 10 + ball_score(frames[1][0]) if spare? frames[0]
  frames[0].chars.collect{ |ball| 
      ball_score(ball)
    }.inject(:+) 
end

def strike_bonus(frames)
  return 10 if frames[0] == "X"
  return 10 + ball_score(frames[1][0]) if strike?(frames[0][0])
  return 10 + frames[0][0].to_i if spare?(frames[0])    #if 4/  4+10
  ball_score(frames[0][0]) + ball_score(frames[0][1])
end

def ball_score(ball)
  return 10 if strike? ball
  ball.to_i
end

def strike?(frame)
  frame == "X"
end

def spare?(frame)
  frame[-1].chr == '/'
end
