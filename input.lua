-- BLAST FLOCK source files
-- by TRASEVOL_DOG (https://trasevol.dog/)

require("drawing")


function init_input_mgr()
  input={}
  input.btn_state={}
  input.btn_press={}
  input.btn_release={}
  
  input.layout={
    left=0,
    right=1,
    up=2,
    down=3,
    z=4,
    x=5,
    p=6,
    escape=7,
    ["return"]=8,
    v=9
  }
  
  input.btn_count=0
  for _,_ in pairs(input.layout) do
    input.btn_count = input.btn_count + 1
  end
  
  for i=0,input.btn_count-1 do
    input.btn_state[i]=false
    input.btn_press[i]=false
    input.btn_release[i]=false
  end
  
  input.mosbtn_state={}
  input.mosbtn_press={}
  input.mosbtn_release={}
 
  for i=0,2 do
    input.mosbtn_state[i]=false
    input.mosbtn_press[i]=false
    input.mosbtn_release[i]=false
  end
  
  input.mosx,input.mosy=love.mouse.getPosition()
end


function btn(k) return input.btn_state[k] end
function btnp(k) return input.btn_press[k] end
function btnr(k) return input.btn_release[k] end


function mouse_pos() return input.mosx,input.mosy end

function mouse_btn(k) return input.mosbtn_state[k] end
function mouse_btnp(k) return input.mosbtn_press[k] end
function mouse_btnr(k) return input.mosbtn_release[k] end


function update_input_mgr()
  for i=0,input.btn_count-1 do
    input.btn_press[i]=false
    input.btn_release[i]=false
  end
  
  for i=0,2 do
    input.mosbtn_press[i]=false
    input.mosbtn_release[i]=false
  end
  
  local omx,omy=input.mosx,input.mosy
  input.mosx,input.mosy=love.mouse.getPosition()
  input.mosx=input.mosx/graphics.scrn_scalex
  input.mosy=input.mosy/graphics.scrn_scaley
  
  input.mosx=input.mosx+0.5*(input.mosx-omx)
  input.mosy=input.mosy+0.5*(input.mosy-omy)
end


function input_keypressed(key)
  local k=input.layout[key]
  
  if k then
    input.btn_state[k]=true
    input.btn_press[k]=true
  end
  
  menu_keypressed(key)
end

function input_keyreleased(key)
  local k=input.layout[key]
  
  if k then
    input.btn_state[k]=false
    input.btn_release[k]=true
  end
end

function input_mousepressed(x,y,k,istouch)
  input.mosbtn_state[k-1]=true
  input.mosbtn_press[k-1]=true
end

function input_mousereleased(x,y,k,istouch)
  input.mosbtn_state[k-1]=false
  input.mosbtn_release[k-1]=true
end
