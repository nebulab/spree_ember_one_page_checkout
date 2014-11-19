`import DS from 'ember-data'`
`import Application from './application'`

StateAdapter = Application.extend
  headers:
    'X-Spree-Token': $.cookie('guest_token')

`export default StateAdapter`
