require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Loop Script. (Ver. alpha1)"
    def score_reset
      #--------------------------------- Background Score
      @Logo_slide = Gosu.milliseconds
      @GameStarted = false
      @GameStartedClicked = false
      @GameCreate = false
      @GameLogo_x = 80
      @GameLogoDraw = true
      @PressEnter_y = 320
      #--------------------------------- Draw Images
      @GameLogo = Gosu::Image.new("GameLogo.jpg")
      @GameLogo_Font = Gosu::Font.new(16)
      @PressEnter_Font = Gosu::Font.new(20)
    end
    score_reset
  end

  def update
    @Logo_slide = Gosu.milliseconds
    if @Logo_slide < 5000
      
    else
      @GameLogo_x += 5 # ずーっと描画するとわずかにラグが発生するので描画しないようにしています。
      if @GameLogo_x >= 4000
        @GameLogoDraw = false
        10.times do |i|
          @PressEnter_y += 10
        end 
        10.times do |i|
          @PressEnter_y -= 10
        @GameStartedClicked = true
        end
      end
    end
  end

  def draw
    if @GameLogoDraw
      @GameLogo.draw(@GameLogo_x, 10, 0, 0.7, 0.7)
      @GameLogo_Font.draw_text("THE SYSTEM BY GAME STUDIO.\nCOPYRIGHT(C) 2025\nALL RIGHTS RESAVED", @GameLogo_x, 430, 0)
    else
      @PressEnter_Font.draw_text("Press Enter to start!...", 240, @PressEnter_y, 0)
    end
  end
  def button_down(id)
    if @GameStartedClicked
      if !@GameStarted
        if id == Gosu::KB_RETURN
          puts "[debug] Game is started"
          @GameStartedClicked = false
          @GameStarted = true
        end
      end
    end
  end
end

window = GameWindow.new
window.show
