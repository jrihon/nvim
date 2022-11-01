local api = vim.api

local M = {}

local function printtable(table)
  for k, v in pairs(table) do print(k, v) end
end

local function parse_visualline_marker()
  -- get start and finish of visual lines
  -- (row,col) are stored in these marks during V-mode
  -- remember, indexing is : (1, 0)
  -- in the table : `1` == row
  -- in the table : `2` == column
  local start = api.nvim_buf_get_mark(0, "<" )
  local last = api.nvim_buf_get_mark(0, ">")

  return start, last
end

local function get_single_line(start_idx)
  local linestr = api.nvim_buf_get_lines(0, start_idx - 1, start_idx, false )

  local match = string.match(linestr[1], '\'')
  if match ~= nil  then
    linestr[1] = string.gsub(linestr[1],'\'', '')
    return linestr
  else
      return linestr
  end
end

local function parse_line(start, last)
  local linestr = get_single_line(start[1])[1] --index row only

  -- If the entire line is selection, the column goes to a high number
  -- So to keep possible effects in check, we parse only the maximum amount of characters
  local len_line = string.len(linestr)
  if last[2] > len_line then
    return string.sub(linestr, start[2] + 1, len_line)
  else
    return string.sub(linestr, start[2] + 1, last[2] + 1)
  end
end

local function pass_to_clipboard(str)
   vim.cmd("!printf '"..str.."' | xclip -sel c")
end


function M.Copy2clipboard()
  local start, last = parse_visualline_marker()

  if start[1] == last[1] then
    local parsed_line = parse_line(start, last)
    print(parsed_line)
    pass_to_clipboard(parsed_line)
  else
--    print(start[1], last[1])
--    print('multiple lines highlighted')
  end
end





return M
