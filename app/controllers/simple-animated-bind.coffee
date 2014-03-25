C = Ember.Controller.extend
  moodCounter: 0
  moodIndex: 0
  mood: 'Happy'

  moods: ['Happy', 'Hungry', 'Tired', 'Sleepy']

  init: ->
    @interval = setInterval((=> @tick()), 1000)
    @tick()
  willDestroy: -> clearInterval(@interval)

  tick: ->
    now = new Date
    @set('hours', now.getHours())
    @set('minutes', now.getMinutes())
    @set('seconds', now.getSeconds())

    @set('moodCounter', (@get('moodCounter')+1) % 4)
    if (@get('moodCounter')==0)
      @set('moodIndex', (@get('moodIndex')+1) % @moods.length)
      @set('mood', @moods[@get('moodIndex')])

`export default C`