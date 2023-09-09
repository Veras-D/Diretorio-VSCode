from googleapiclient.discovery import build

# Configure a API client
api_key = 'AIzaSyC_IPq2HTaYqkNP6kuWnI2-0SHIUcJE1C0'  # Substitua pelo seu próprio API key
youtube = build('youtube', 'v3', developerKey=api_key)

# Envie uma solicitação para listar as playlists do usuário
playlists = youtube.playlists().list(
    part='snippet',
    mine=True
).execute()

# Itere sobre as playlists e construa os links
for playlist in playlists.get('items', []):
    playlist_id = playlist['id']
    playlist_title = playlist['snippet']['title']
    playlist_link = f'https://www.youtube.com/playlist?list={playlist_id}'
    print(f'Playlist: {playlist_title}')
    print(f'Link: {playlist_link}')
