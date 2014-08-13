# Delivery API

API para calcular o menor custo e menor caminho para realizar um determinada entrega considerando a origem e destino.

Utiliza uma base de mapas com o mapa e as rotas disponíveis para este mapa.

Solução baseado no algoritmo [Dijkstra](http://en.wikipedia.org/wiki/Dijkstra's_algorithm) para calcular a menor distância entre dois pontos.

### Git

    $ git clone git@github.com:wagnerjgoncalves/delivery_api.git

### Configuração

    $ bundle exec rake db:create

    $ bundle exec rake db:migrate

    $ bundle exec rake db:seed

    $ bundle exec rails s

### Para rodar os testes local

    $ bin/rspec spec

### Mapas

  Listar mapas existentes:

    GET  /api/maps.json

        curl --request GET localhost:3000/api/maps.json

  Criar novo mapa:

    POST /api/maps.json
        parameter: name

        curl --request POST --form "name=RJ" localhost:3000/api/maps.json

  Salvar nova rota para o mapa:

    POST /api/map_routes.json
        parameters: from, to, distance, map_id

       curl --request POST --form "from=A" --form "to=B" --form "distance=10" --form "map_id=1" localhost:3000/api/map_routes.json

### Entrega:

    GET /api/deliveries.json
        parameters: map, autonomy, fuel_cost, from, to

        curl --request GET --form "map=SP" --form "autonomy=1" --form fuel_cost=5 --form from=A --form to=E localhost:3000/api/deliveries.json
