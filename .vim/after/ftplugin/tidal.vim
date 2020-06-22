if exists("g:tidal_no_mappings") || g:tidal_no_mappings
  if !hasmapto('<Plug>TidalConfig', 'n')
    nmap <buffer> <localleader>c <Plug>TidalConfig
  endif

  if !hasmapto('<Plug>TidalRegionSend', 'x')
    xmap <buffer> <localleader>s  <Plug>TidalRegionSend
    xmap <buffer> <c-s> <Plug>TidalRegionSend
  endif

  if !hasmapto('<Plug>TidalLineSend', 'n')
    nmap <buffer> <localleader>s  <Plug>TidalLineSend
  endif

  if !hasmapto('<Plug>TidalParagraphSend', 'n')
    nmap <buffer> <localleader>ss <Plug>TidalParagraphSend
    nmap <buffer> <c-s> <Plug>TidalParagraphSend
  endif

  imap <buffer> <c-s> <Esc><Plug>TidalParagraphSend<Esc>i<Right>

  nnoremap <buffer> <localleader>h :TidalHush<cr>
  nnoremap <buffer> <c-h> :TidalHush<cr>
  let i = 1
  while i <= 9
    execute 'nnoremap <buffer> <localleader>'.i.'  :TidalSilence '.i.'<cr>'
    execute 'nnoremap <buffer> <c-'.i.'>  :TidalSilence '.i.'<cr>'
    execute 'nnoremap <buffer> <localleader>s'.i.' :TidalPlay '.i.'<cr>'
    let i += 1
  endwhile 
endif
