express  = require 'express'
router = express.Router()
canvas = require 'canvas'
image = canvas.Image

colors = [
  ['#D770AD', '#EC87C0'],
  ['#4A89DC', '#5D9CEC'],
  ['#3BAFDA', '#4FC1E9'],
  ['#37BC9B', '#48CFAD'],
  ['#8CC152', '#A0D468'],
  ['#F6BB42', '#FFCE54'],
  ['#E9573F', '#FC6E51'],
  ['#DA4453', '#ED5565'],
  ['#967ADC', '#AC92EC']
]

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

isInWords = (hash) ->
  for i, val of words
    if val is hash
      return true
  return false

getCanvas = (word, rand) ->
  canv = new canvas(600, 315)
  ctx = canv.getContext('2d')
  grd = ctx.createLinearGradient(0,0,600,315);
  grd.addColorStop(0,colors[rand][0]);
  grd.addColorStop(1,colors[rand][1]);
  ctx.fillStyle = grd;
  ctx.fillRect(0, 0,600,315);

  ctx.font = '70px Source Sans Pro'
  ctx.textAlign = "center"

  ctx.fillStyle = 'white';
  ctx.fillText(word, 300, 170)

  return canv.toDataURL()

module.exports = (app) ->
  app.use '/', router

router.get '/', (req, res, next) ->
  word = words[Math.floor(Math.random() * words.length)]
  if word
    res.redirect("/#{word}")
  else
    res.render 'index',
      word: word
      rand: rand

router.get '/:word', (req, res, next) ->
  rand = Math.floor(Math.random() * 8)
  if isInWords(req.params.word)
    word = req.params.word
    res.render 'index',
      word: word
      rand: rand
      img: getCanvas(word, rand)
  else
    res.redirect("/")

router.post '/:word', (req, res, next) ->
  res.redirect("/")



