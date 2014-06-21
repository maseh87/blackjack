#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @attributes.playerHand.on 'add', @checkPlayerScore, @
    # @attributes.dealerHand.on 'change', @checkDealerScore, @

    (@get 'playerHand').on 'hit', =>
      alert 'busted!' if (@get 'playerHand').scores()[0] > 21
      #if an alert is triggered the page will reload
      # location.reload()

    (@get 'playerHand').on 'stand', =>
      (@get 'dealerHand').models[0].flip()
      (@get 'dealerHand').hit() while (@get 'dealerHand').scores()[0] <= 16 or (@get 'dealerHand').scores()[1] <= 16

    (@get 'dealerHand').on 'hit', =>
      if (@get 'dealerHand').scores()[0] > 21
        alert 'Dealer Busts'
        location.reload()
        return
      if (@get 'dealerHand').scores()[0] > (@get 'playerHand').scores()[0]
        alert 'You Lose'
        location.reload()
      else if (@get 'dealerHand').scores()[0] == (@get 'playerHand').scores()[0]
        alert 'Split Pot!'
        location.reload()
      else (@get 'dealerHand').hit()