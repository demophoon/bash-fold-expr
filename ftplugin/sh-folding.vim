setlocal foldmethod=expr
setlocal foldexpr=GetBashFold(v:lnum)

function! GetBashFold(lnum)

  " End of if statement
  if getline(a:lnum) =~? '\v^\s*fi\s*$'
    return 's1'
  endif
  " Start of if statement
  if getline(a:lnum) =~? '\v^\s*if.*(;\s*then)?$'
    return 'a1'
  endif

  " End of while/for statement
  if getline(a:lnum) =~? '\v^\s*done\s*$'
    return 's1'
  endif
  " Start of while/for statement
  if getline(a:lnum) =~? '\v^\s*(while|for).*(;\s*do)?$'
    return 'a1'
  endif

  " End of case statement
  if getline(a:lnum) =~? '\v^\s*esac\s*$'
    return 's1'
  endif
  " Start of case statement
  if getline(a:lnum) =~? '\v^\s*case.*(\s*in)$'
    return 'a1'
  endif

  " End of function statement
  if getline(a:lnum) =~? '\v^\s*\}$'
    return 's1'
  endif
  " Start of function statement
  if getline(a:lnum) =~? '\v^\s*\S+\(\) \{'
    return 'a1'
  endif

  " Default
  return '='

endfunction
