# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'DOMContentLoaded', (->
  posts_editables = document.getElementsByClassName('well')
  i = 0
  while i < posts_editables.length
    console.log 'a'
    posts_editables[i].addEventListener 'mouseover', ->
      @firstChild.nextSibling.classList.remove 'none_visable'
      return
    posts_editables[i].addEventListener 'mouseleave', ->
      @firstChild.nextSibling.classList.add 'none_visable'
      return
    i++
  return
), false
