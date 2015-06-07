(function() {
  var S;

  S = window.S || {};

  S = (function() {
    var _bindEvents, _checkDownKeyPressed, _checkKeyPressed, _getWord, _handleClick, _loadFromHash, _next, _pageLoad, _removeClasses, _selectAllText, _showLink, _updateUrls, canv, el, hash, input, isInWords, prev, rand, shareurl, words;
    words = ["ace", "amazing", "astonishing", "astounding", "awe-inspiring", "awesome", "badass", "beautiful", "bedazzling", "best", "breathtaking", "brilliant", "cat's meow", "cat's pajamas", "classy", "cool", "dandy", "dazzling", "delightful", "divine", "doozie", "epic", "excellent", "exceptional", "exquisite", "extraordinary", "fabulous", "fantastic", "fantabulous", "fine", "finest", "first-class", "first-rate", "flawless", "funkadelic", "geometric", "glorious", "gnarly", "good", "grand", "great", "groovy", "groundbreaking", "hunky-dory", "impeccable", "impressive", "incredible", "kickass", "kryptonian", "laudable", "legendary", "lovely", "luminous", "magnificent", "majestic", "marvelous", "mathematical", "mind-blowing", "neat", "outstanding", "peachy", "perfect", "phenomenal", "pioneering", "polished", "posh", "praiseworthy", "premium", "priceless", "prime", "primo", "rad", "remarkable", "riveting", "sensational", "shining", "slick", "smashing", "solid", "spectacular", "splendid", "stellar", "striking", "stunning", "stupendous", "stylish", "sublime", "super", "super-duper", "super-excellent", "superb", "superior", "supreme", "swell", "terrific", "tiptop", "top-notch", "transcendent", "tremendous", "ultimate", "unreal", "well-made", "wicked", "wonderful", "wondrous", "world-class"];
    prev = 1;
    rand = 1;
    canv = document.getElementById('awe-can');
    el = document.getElementById('awe-sel');
    input = document.getElementById('copyurl');
    shareurl = document.getElementById('shareurl');
    hash = document.location.hash.replace(/#/g, "");
    _pageLoad = function() {
      if (hash === '') {
        return _next(_getWord());
      } else {
        return _loadFromHash();
      }
    };
    _next = function(rword) {
      el.className = "animated fadeInUp";
      el.innerHTML = rword;
      while (prev === rand) {
        rand = Math.floor(Math.random() * 8);
      }
      canv.className = "page c" + (rand + 1);
      prev = rand;
      return _updateUrls(rword);
    };
    _loadFromHash = function() {
      if (isInWords(hash)) {
        return _next(hash);
      } else {
        return _next(_getWord());
      }
    };
    isInWords = function(hash) {
      var i, val;
      for (i in words) {
        val = words[i];
        if (val === hash) {
          return true;
        }
      }
      return false;
    };
    _bindEvents = function() {
      return canv.addEventListener('click', _handleClick, false);
    };
    _removeClasses = function() {
      el.className = "";
      if (canv.classList) {
        return canv.classList.add("o0");
      } else {
        return canv.className += " " + "animate";
      }
    };
    _handleClick = function() {
      return document.getElementById("next").submit();
    };
    _showLink = function() {
      input.className = "textfield active";
      return input.select();
    };
    _selectAllText = function(e) {
      return this.select();
    };
    _checkDownKeyPressed = function(e) {
      var k;
      k = e.keyCode;
      if (k === 37 || k === 38 || k === 39 || k === 40) {
        return _removeClasses();
      }
    };
    _checkKeyPressed = function(e) {
      var k;
      k = e.keyCode;
      if (k === 37 || k === 38 || k === 39 || k === 40) {
        return _next(_getWord());
      }
    };
    _updateUrls = function(rword) {
      var twitter, twitterUrl;
      twitter = document.getElementById('twitter');
      twitterUrl = "https://twitter.com/intent/tweet?original_referer=" + (encodeURIComponent(document.URL)) + "&text=" + twitter.dataset.text + "&tw_p=tweetbutton&url=" + (encodeURIComponent(document.URL)) + "&via=" + twitter.dataset.via;
      twitter.href = twitterUrl;
      document.location.hash = rword;
      document.title = rword;
      return input.value = document.URL;
    };
    _getWord = function() {
      return words[Math.floor(Math.random() * words.length)];
    };
    return {
      init: function() {
        _bindEvents();
      }
    };
  })();

  S.init();

}).call(this);
