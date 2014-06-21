#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @attributes.playerHand.on 'add', @checkPlayerScore, @
    @attributes.dealerHand.on 'change', @checkDealerScore, @


  checkPlayerScore: ->
    if @attributes.playerHand.scores() > 21
      alert 'busted!'

  checkDealerScore: ->
    if @attributes.playerHand.scores() > @attributes.dealerHand.scores()
      alert 'You Win!'
    else
      alert 'You Lose!'
