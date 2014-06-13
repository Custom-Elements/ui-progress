#ui-progress
A slim, stylish progress indicator that appears at the top of the page. This
is super useful for AJAX and other operations of unknown duration.

    TRICKLE_TIMER = 800
    TRICKLE_RATE = 2


    Polymer 'ui-progress',

##Attributes and Change Handlers
###percentage
As a number 0-100, you can update this manually, and it will also trickle
upward.

      percentageChanged: ->
        @$.fill.style.width = "#{@percentage}%"
        if Number(@percentage) >= 100 or Number(@percentage) <= 0
          @$.fill.setAttribute 'hide', ''
          setTimeout =>
            @percentage = 0
          , TRICKLE_TIMER

        else
          @$.fill.removeAttribute 'hide'
          setTimeout =>
            @percentage = Number(@percentage) + (Math.random() * TRICKLE_RATE)
          , TRICKLE_TIMER

##Methods
###start
Kick off progress visualization, resetting the percentage to 0 or the passed
value.

      start: (percentage) ->
        @percentage = percentage or 1

###stop
Finish out and fade away.

      stop: (percentage) ->
        @percentage = 100

##Event Handlers

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->

      detached: ->
