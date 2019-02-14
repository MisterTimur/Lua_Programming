-- Абдулов Тимур 2019 год 
-- 
Про="" -- Исходный код программы
Нач=1  -- Позиция начала слова  
Кон=1  -- Позиция конца слова 
Пер={} -- Массив с переменными 
function Циф() -- Определяет цифра ли это 
local  Рез=false  
if string.sub(Про,Кон,Кон)>="0" and 
   string.sub(Про,Кон,Кон)<="9" then  Рез=true end 
return Рез
end
function Удп() -- Пропускаем пробелы 
while string.sub(Про,Нач,Нач)==" " do Нач=Нач+1 end
Кон=Нач
end

function Сло() -- Возвращает текущее слово 
  Удп() -- Пропускаем пробелы 
  Кон=Нач
  if Циф() then  
    while Циф() do Кон=Кон+1 end
    Кон=Кон-1
  end
  return string.sub(Про,Нач,Кон)
end

function Сле() -- Переход к следующему слову  
Нач=Кон+1;
Кон=Нач;
end
function Изв() -- Извлекает слово и переходит к след 
local Рез=Сло()
      Сле()
      return Рез
end
function Бук() -- Определяет явлетсся ли слово буквой 
  local Рез=false    
      if Сло()>="a" and Сло()<="z" then Рез=true
  elseif Сло()>="A" and Сло()<="Z" then Рез=true  end
  return Рез
end
function Ско() -- Скобка 
local Рез=0;
        if Бук()      then local Инд=0;
                           Инд=string.byte(Изв())
                           Рез=Пер[Инд]
                           if Сло()=="=" then 
                           Сле()  
                           Пер[Инд]=Плю(Ско()) 
                           Рез=Пер[Инд]
                           end  
    elseif Сло()=="(" then Сле() Рез=Плю(Ско()) 
                           if Сло()~=")" then
                           error(" Excepted ) ")  
                           end
                           Сле() 
    else Рез=Изв() end
return Рез
end

function Умн(Рез) -- Умножение и деление 
    while Сло()=="*" or Сло()=="/" do 
         if Сло()=="*" then Сле() Рез=Рез*Ско()
     elseif Сло()=="/" then Сле() Рез=Рез/Ско() end   
    end 
   return Рез
end
 
function Плю(Рез) -- Сложнеие и вычитание 
         Рез=Умн(Рез)
    while Сло()=="+" or Сло()=="-" do 
         if Сло()=="+" then Сле() Рез=Рез+Умн(Ско())
     elseif Сло()=="-" then Сле() Рез=Рез-Умн(Ско()) end   
    end 
   return Рез
end
function Вып(Стр) -- Выполнение программы
Про=Стр
Нач=1
Кон=1
repeat 
local  Нор,Рез=pcall(Ско) print(Нор," "..Рез)
until  Рез=="" or Нор==false
return Рез
end
 
print(Вып("A=1 B=(2) C=3 D=4 E=(A+(B*C)+D) "))
print(Вып("A=1 B=(2) "))  
   
   