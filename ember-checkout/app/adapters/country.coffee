`import DS from 'ember-data'`
`import Application from './application'`

CountryAdapter = Application.extend
  headers:
    'X-Spree-Token': $.cookie('guest_token')

`export default CountryAdapter`
