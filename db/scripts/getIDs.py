import urllib, json

url = 'http://api.steampowered.com/ISteamApps/GetAppList/v0001/'

response = urllib.urlopen(url)
data = json.loads(response.read())['applist']['apps']['app']

print(len(data))

y = 0
with open('IDs.txt', 'w') as fh:
    fh.write('appid,name\n')
    for x in range(0, len(data)):
        if data[x]['appid'] % 10 == 0:
            y += 1
            fh.write('{0},{1}\n'.format(data[x]['appid'], data[x]['name'].encode('utf-8')))

print(y)
