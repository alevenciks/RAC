require_relative 'features/support/API'
require 'json'

job_name = ARGV[0]
job_number = ARGV[1]

thumbnail = {'url' => 'https://fortunedotcom.files.wordpress.com/2014/09/451256444.jpg'}

fields = []

fields.push({'name' => 'Autors', 'value'=>'Aleksejs'})
fields.push({'name' => 'TA', 'value'=>'DA'})
fields.push({'name' => 'Job', 'value' => job_name})
fields.push({'name' => 'Build number', 'value' => job_number})


embeds = []

embeds.push({'title' => 'test title',
           'color' => 25000,
           'thumbnail' => thumbnail,
           'fields' => fields})

payload = {
    'content' => 'Aleksejs Levenciks',
    'embeds' => embeds}.to_json

API.post('https://discordapp.com/api/webhooks/459005793627406359/-6FGK6la-XlTO_UZ2G62Cx-TZ0AwmMqIPd3rBkusV1nwPQo1RlmhAp3Kaxn_gHS85Aqs',
                               headers: {'Content-Type' => 'application/json'},
                               cookies: {},
                               payload: payload)