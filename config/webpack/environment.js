const { environment } = require('@rails/webpacker')

const webpacker = require('webpacker')
environment.plugins.append('Provide',
  new webpacker.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
  )

module.exports = environment
