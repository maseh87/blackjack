class window.CardView extends Backbone.View

  #the writing on the individual cards

  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
