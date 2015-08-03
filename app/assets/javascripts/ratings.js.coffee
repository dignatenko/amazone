$ ->
  $('.rating-select .btn').on 'mouseover', ->
    $(this).removeClass('btn-default').addClass 'btn-warning'
    $(this).prevAll().removeClass('btn-default').addClass 'btn-warning'
    $(this).nextAll().removeClass('btn-warning').addClass 'btn-default'
    return
  $('.rating-select').on 'mouseleave', ->
    active = $(this).parent().find('.selected')
    if active.length
      active.removeClass('btn-default').addClass 'btn-warning'
      active.prevAll().removeClass('btn-default').addClass 'btn-warning'
      active.nextAll().removeClass('btn-warning').addClass 'btn-default'
    else
      $(this).find('.btn').removeClass('btn-warning').addClass 'btn-default'
    return
  $('.rating-select .btn').click ->
    if $(this).hasClass('selected')
      $('.rating-select .selected').removeClass 'selected'
    else
      $('.rating-select .selected').removeClass 'selected'
      $(this).addClass 'selected'
    return
  return
