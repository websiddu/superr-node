S = window.S or {}

S = do ->
  words = [
    "ace",
    "amazing",
    "astonishing",
    "astounding",
    "awe-inspiring",
    "awesome",
    "badass",
    "beautiful",
    "bedazzling",
    "best",
    "breathtaking",
    "brilliant",
    "cat's meow",
    "cat's pajamas",
    "classy",
    "cool",
    "dandy",
    "dazzling",
    "delightful",
    "divine",
    "doozie",
    "epic",
    "excellent",
    "exceptional",
    "exquisite",
    "extraordinary",
    "fabulous",
    "fantastic",
    "fantabulous",
    "fine",
    "finest",
    "first-class",
    "first-rate",
    "flawless",
    "funkadelic",
    "geometric",
    "glorious",
    "gnarly",
    "good",
    "grand",
    "great",
    "groovy",
    "groundbreaking",
    "hunky-dory",
    "impeccable",
    "impressive",
    "incredible",
    "kickass",
    "kryptonian",
    "laudable",
    "legendary",
    "lovely",
    "luminous",
    "magnificent",
    "majestic",
    "marvelous",
    "mathematical",
    "mind-blowing",
    "neat",
    "outstanding",
    "peachy",
    "perfect",
    "phenomenal",
    "pioneering",
    "polished",
    "posh",
    "praiseworthy",
    "premium",
    "priceless",
    "prime",
    "primo",
    "rad",
    "remarkable",
    "riveting",
    "sensational",
    "shining",
    "slick",
    "smashing",
    "solid",
    "spectacular",
    "splendid",
    "stellar",
    "striking",
    "stunning",
    "stupendous",
    "stylish",
    "sublime",
    "super",
    "super-duper",
    "super-excellent",
    "superb",
    "superior",
    "supreme",
    "swell",
    "terrific",
    "tiptop",
    "top-notch",
    "transcendent",
    "tremendous",
    "ultimate",
    "unreal",
    "well-made",
    "wicked",
    "wonderful",
    "wondrous",
    "world-class"
  ]

  prev = 1
  rand = 1
  canv = document.getElementById('awe-can')
  el = document.getElementById('awe-sel')
  input = document.getElementById('copyurl')
  shareurl = document.getElementById('shareurl')
  hash = document.location.hash.replace(/#/g, "")

  # Load the page
  _pageLoad = ->
    if hash is ''
      _next(_getWord())
    else
      _loadFromHash()

  # Load the next word
  _next = (rword) ->
    el.className = "animated fadeInUp"
    el.innerHTML = rword
    while prev == rand
      rand = Math.floor(Math.random() * 8)
    canv.className = "page c#{rand+1}"
    prev = rand
    _updateUrls(rword)

  # Load the page from the hash
  _loadFromHash = ->
    if isInWords(hash)
      _next(hash)
    else
      _next(_getWord())

  # Check if the hash exists in thw word
  isInWords = (hash) ->
    for i, val of words
      if val is hash
        return true
    return false

  # Bind all the events
  _bindEvents = ->
    #window.addEventListener("keydown", _checkDownKeyPressed, false)
    #window.addEventListener("keyup", _checkKeyPressed, false)
    #input.addEventListener('click', _selectAllText, false)
    #shareurl.addEventListener('click', _showLink, false)
    canv.addEventListener('click', _handleClick, false)

  # Remove the classes for the animation
  _removeClasses = ->
    el.className = ""
    if (canv.classList)
      canv.classList.add("o0");
    else
      canv.className += " " + "animate";

  # Handle click
  _handleClick = ->
    document.getElementById("next").submit();
    # _removeClasses()
    # setTimeout ->
    #   _next(_getWord())
    # , 100

  # Text filed animation
  _showLink = ->
    input.className = "textfield active"
    input.select()

  # Select all the text
  _selectAllText = (e) ->
    this.select()

  # Handle the keydown
  _checkDownKeyPressed = (e) ->
    k = e.keyCode
    if k in [37, 38, 39, 40]
      _removeClasses()

  # Handle the keyup
  _checkKeyPressed = (e) ->
    k = e.keyCode
    if k in [37, 38, 39, 40]
      _next(_getWord())

  # Update the URL's the twitter, document hash and input value
  _updateUrls = (rword) ->
    twitter = document.getElementById('twitter')
    twitterUrl = "https://twitter.com/intent/tweet?original_referer=#{encodeURIComponent(document.URL)}&text=#{twitter.dataset.text}&tw_p=tweetbutton&url=#{encodeURIComponent(document.URL)}&via=#{twitter.dataset.via}"
    twitter.href = twitterUrl
    document.location.hash = rword;
    document.title = rword;
    input.value = document.URL

  _getWord = ->
    return words[Math.floor(Math.random() * words.length)]

  # Initilize the app
  init: ->
    _bindEvents()
    #_pageLoad()
    return

S.init()


