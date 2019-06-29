# Chat Server [Ruby on Rails]
## How to run
### 0. Install dependencies
To work with project you need to have installed docker. All manuals ypu can find [here](https://docs.docker.com/install/).  
### 1. Clone repo
Clone this repo to your computer

`git clone https://github.com/yuri-val/chat_server`

### 2. Start project
Go to project directory and execute follow command in terminal:

`docker-compose up --build`

### 3. Access to project
To access project's entrypoints you can use locale address or serveo's revers address:
- `http:localhost:8000`  
- `https://chat_server2019.serveo.net`

WebSocket server also work on local and remote address:
- `ws:localhost:1030`  
- `wss://chat_server2019.serveo.net:1030`

## Ecosystem

**Platform:** Ruby [2.6.3]; Rails [5.2.3]

**Database:** Postgres [10.3]

**Key-Value Storage:** Redis [4.0]

**WebSocket Server:** Rails built-in *ActionCable* [5.2.3]

## Entrypoints

You can find [here](https://docs.google.com/document/d/1IQk0IWjdqDhTTXcB4O8P5gH1W308MUypSyos0GHZOzI/edit)  
