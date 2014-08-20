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
        else
          @$.fill.removeAttribute 'hide'
          @job 'progress', ->
            @percentage = Number(@percentage) + (Math.random() * TRICKLE_RATE)
          , TRICKLE_TIMER

##Methods
###start
Kick off progress visualization, resetting the percentage to 0 or the passed
value.

      start: (percentage) ->
        if not @stack
          @percentage = 1
        @stack += 1

###stop
Finish out and fade away.

      stop: (percentage) ->
        @stack -= 1 if @stack
        if not @stack
          @percentage = 100

##Event Handlers

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->
        @stack = 0

      domReady: ->

      detached: ->
