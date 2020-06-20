let g:tidal_target = "terminal"
let g:tidal_no_mappings = 1


if exists("g:tidal_no_mappings") || g:tidal_no_mappings
    nmap <buffer> <localleader>c <Plug>TidalConfig
    xmap <buffer> <c-c> <Plug>TidalRegionSend
    nmap <buffer> <c-c> <Plug>TidalParagraphSend
    imap <buffer> <c-c> <Esc><Plug>TidalParagraphSend<Esc>i<Right>
endif

  if !hasmapto('<Plug>TidalRegionSend', 'x')
    xmap <buffer> <localleader>s  <Plug>TidalRegionSend
  endif

  if !hasmapto('<Plug>TidalLineSend', 'n')
    nmap <buffer> <localleader>s  <Plug>TidalLineSend
  endif

  if !hasmapto('<Plug>TidalParagraphSend', 'n')
    nmap <buffer> <localleader>ss <Plug>TidalParagraphSend
  endif


  nnoremap <buffer> <localleader>h :TidalHush<cr>
  nnoremap <buffer> <c-h> :TidalHush<cr>
  let i = 1
  while i <= 8
    execute 'nnoremap <buffer> <localleader>'.i.'  :TidalSilence '.i.'<cr>'
    execute 'nnoremap <buffer> <c-'.i.'>  :TidalSilence '.i.'<cr>'
    execute 'nnoremap <buffer> <localleader>s'.i.' :TidalPlay '.i.'<cr>'
    let i += 1
  endwhile
