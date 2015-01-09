create = ->
  console.log 'creating...'
  document.getElementsByClassName('ta-bind')[0].focus()
  # Text editor_________________________________________________________________

  # console.log $('.form-content').attributes

  # console.log $('.form-content')
  # console.log $('#taTextElement1629901258274912')
  # content = document.getElementsByTagName('section')[0]
  # from = document.getElementById('from')
  # text = document.createElement("div")
  submitDrawerButton = document.getElementById("openSubmitDrawer")
  submitToolbarButton = document.getElementById("openToolbar")
  toolbar = document.getElementsByClassName('ta-toolbar')[0]

  # console.log document.getElementsByClassName('ta-toolbar')[0]
  submitDrawer = document.getElementById("submitDrawer")
  toggleSubmitDrawer = ->
    if submitDrawer.getAttribute('on') =='true'
      submitDrawer.style.width= '0px'
      submitDrawerButton.style.transform='rotate(0deg)'
      submitDrawer.setAttribute('on','false')
    else
      submitDrawer.style.width= '300px'
      submitDrawerButton.style.transform='rotate(180deg)'
      submitDrawer.setAttribute('on','true')

  toggleToolbar = ->
    if submitToolbarButton.getAttribute('on') =='true'
      submitToolbarButton.setAttribute('on','false')
      toolbar.style.width= '0px'
      submitToolbarButton.style.transform='rotate(0deg)'
      setTimeout(()->
        if submitToolbarButton.getAttribute('on') =='false'
          toolbar.style.display ='none'
      ,500)

    else
      toolbar.style.display="block"
      setTimeout(()->
        toolbar.style.width= '250px'
        submitToolbarButton.style.transform='rotate(180deg)'
      ,10)

      submitToolbarButton.setAttribute('on','true')

  submitDrawerButton.addEventListener 'click',toggleSubmitDrawer

  submitToolbarButton.addEventListener 'click',toggleToolbar


  # console.log content
  # console.log from
  # content[0].innerHTML = "<h1>New</h1>"
  # content.innerHTML = from.value
  # Meun________________________________________________________________________
  menu = document.querySelector '#menu'
  showMenu = ->
    menu.style.left = "0px"

  hideMenu = ->
    menu.style.left="-999px"

  searchBar = document.querySelector '#filter'
  searchButton = document.querySelector '#search-icon'

  hideSearchBar = ->
    if searchBar.value == ''
      searchBar.style.width = '0px'
      searchButton.style.right = '200px'
      setTimeout(()->
        searchBar.style.display = 'none'
      ,500)


  showSearchBar =  ->
    searchBar.style.display = 'block'
    setTimeout(()->
      searchBar.style.width = '90%'
      searchBar.focus()
      searchButton.style.right = '30px'
    ,10)


  searchButton.addEventListener 'click',showSearchBar
  searchBar.addEventListener 'blur', hideSearchBar

  # Menu settings_______________________________________________________________
  menuSettings = document.querySelector '#menu-settings'
  settingsButton = document.querySelector '#menu-settings-button'
  settingsClose = document.querySelector '#menu-settings-close'
  subjectInputs = document.querySelectorAll '.subject-input'
  subjectLabels = document.querySelectorAll '.subject-label'

  showSettingsElementsLabels = ->
    [].forEach.call(subjectLabels, (label) ->
      label.style.display='block'
      setTimeout(()->
        label.style.opacity = '1'
      ,10)
    )

  showSettingsElementsInputs = ->
    [].forEach.call(subjectInputs, (input) ->
      input.style.display='block'
      setTimeout(()->
        input.style.opacity = '1'
      ,10)
    )
  showSettingsElements = ->
    showSettingsElementsInputs()
    showSettingsElementsLabels()


  showSettings = ->
    menuSettings.style.display='block'
    setTimeout(()->
      menuSettings.style.height = '200px'
      menuSettings.style.borderBottom ='4px solid #5eb793'
      # menuSettings.style.borderTop ='5px solid #5eb793'
      menuSettings.setAttribute('on',true)
      setTimeout(showSettingsElements,500)
    ,20)


    undefined

  hideSettings = ->
    setTimeout(()->
      [].forEach.call(subjectInputs, (input) ->
        input.style.opacity = '0'
        setTimeout(()->
          if menuSettings.getAttribute('on') =='false'
            input.style.display='none'
        ,10)
      )
      [].forEach.call(subjectLabels, (label) ->
        label.style.opacity = '0'
        setTimeout(()->
          if menuSettings.getAttribute('on') =='false'
            label.style.display='none'
        ,10)
      )
    ,100)

    menuSettings.style.height = '0px'
    menuSettings.style.borderBottom ='0'
    # menuSettings.style.borderTop ='0'
    setTimeout(()->
      if menuSettings.getAttribute('on') =='false'
        menuSettings.style.display='none'
    ,500)
    menuSettings.setAttribute('on',false)

    undefined

  toggleSettings =->
    if menuSettings.getAttribute('on')=='false'
      showSettings()
    else
      hideSettings()

  settingsButton.addEventListener 'click',toggleSettings
  settingsClose.addEventListener 'click',toggleSettings

# Menu Button___________________________________________________________________
  menuButton = document.querySelector '#menu-button'

  BuildListener = ->
    menuButton.addEventListener 'click', ClickListener
    undefined

  ClickListener = ->
    if menuButton.getAttribute('on') == 'false'
      setTimeout showMenu, 20

      menuButton.className = 'menu-button-close-start-animation'

      callbackTwo = ->
        menuButton.className = 'menu-button-close-hover-animation'
        parent = menuButton.parentNode
        parent.removeChild menuButton
        menuButton = document.createElement 'div'
        menuButton.id= 'menu-button'
        menuButton.setAttribute 'class','menu-button-close-hover-animation'
        menuButton.setAttribute 'on','true'
        icon = document.createElement 'h1'
        icon.className='fa fa-book'
        menuButton.appendChild(icon)
        parent.appendChild(menuButton)
        build = new Event 'build'
        menuButton.addEventListener 'build', BuildListener

        menuButton.dispatchEvent build

      callback = ->
        menuButton.className = 'menu-button-close-end-animation'
        setTimeout callbackTwo,500

      setTimeout callback,200

      menuButton.setAttribute('on',true)
    else
      setTimeout hideMenu, 20
      callbackTwo = ->
        parent = menuButton.parentNode
        parent.removeChild menuButton
        menuButton = document.createElement 'div'
        menuButton.id= 'menu-button'
        menuButton.setAttribute 'class', 'menu-button-default-animation'
        menuButton.setAttribute 'on','false'
        icon = document.createElement 'h1'
        icon.className='fa fa-book'
        menuButton.appendChild(icon)
        parent.appendChild(menuButton)
        build = new Event 'build'
        menuButton.addEventListener 'build', BuildListener
        menuButton.dispatchEvent build
        menuButton.setAttribute('on',false)

      callback = ->
        menuButton.className = 'menu-button-default-noHover-animation'
        setTimeout callbackTwo,500
        undefined

      menuButton.className = 'menu-button-close-start-animation'
      setTimeout callback,200
      undefined

  # console.log menuButton
  menuButton.addEventListener 'click', ClickListener

setTimeout create,1500
