-- 此为示例菜单模板
function menu(options, isMultiChoice)
  -- 打印欢迎信息和选项列表
  local choices = {}
  for i, option in ipairs(options) do
    table.insert(choices, option[1]) -- 将选项名称添加到选项列表中
  end

  local selectedChoices
  if isMultiChoice then
    selectedChoices = gg.multiChoice(choices, nil, "请选择一个或多个功能：")
    for key, value in pairs(selectedChoices) do
        if value == true then selectedChoices[key] = key end
    end
  else
    local choice = gg.choice(choices, nil, "请选择一个功能：")
    if choice == nil then return end -- 如果用户按下返回键，则返回
    selectedChoices = {choice}
  end
  -- 根据选择执行相应的操作
  for key, value in pairs(selectedChoices) do
  
  local funcs = {}
    for i=2, #options[value] do
        
        table.insert(funcs, options[value][i])
    end
      for _, func in ipairs(funcs) do
        func() -- 调用函数
      end
  end
end




-- 定义各个功能的函数
function function1()
  gg.alert("你选择了普通选项一！")
end

function function2()
  gg.alert("你选择了普通选项二！")
end

function function3()
  gg.alert("你选择了普通选项三！")
end

function function4()
  gg.alert("你选择了普通选项四！")
end

function exitScript()
  gg.alert("感谢您使用本脚本！即将退出...")
end


-- 定义第一个菜单的选项列表
local options1 = {
  {"普通选项一", function1,},
  {"普通选项二", function2},
  {"普通选项三", function3},
  {"普通选项四", function4},
  {"多功能选项", function1, function2, function3, function4} -- 将多个函数作为参数传递给该选项
}

-- 调用菜单
menu(options1, false) -- 单选菜单
menu(options1, true) -- 多选菜单
