from discord_webhook import DiscordWebhook, DiscordEmbed

webhook = DiscordWebhook(url='https://discord.com/api/webhooks/816058185500590091/ZNFVyDnsIuDHayUvsj8AvJlhx12md4h5b_muOMlf43dZxQLlCkaluqglDpGkGXefkiy7')

embed = DiscordEmbed(title='Subtaken Scan', description='Subdomain Scan completed!', color='03b2f8')

webhook.add_embed(embed)

response = webhook.execute()
