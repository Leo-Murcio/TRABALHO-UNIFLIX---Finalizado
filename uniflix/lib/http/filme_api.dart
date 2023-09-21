// Importando as bibliotecas necessárias
import 'dart:convert'; // Biblioteca para lidar com codificação e decodificação de JSON.
import '../model/filme.dart'; // Importando a classe Filme do seu modelo.

// Definindo a classe FilmeApi
class FilmeApi {
  // Uma string que simula a resposta da API em formato JSON.
  String respostaApi =
      '''
    [
      {
          "id": 1,
          "titulo": "Homem de Ferro 2",
          "resumo":"Filme do Homem que se veste de lata",
          "atores":"Robert Downey",
          "capa":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7N_b-vwORDEgNSIssct5VjcZ-vuraqWfRIw&usqp=CAU",
          "duracao":140
      },
      {
          "id": 2,
          "titulo": "Superman",
          "resumo":"To voando alto",
          "atores":"Henry Cavill",
          "capa":"https://miro.medium.com/v2/resize:fit:1400/1*gOLsKIf2ciZsaXvsDrSqnQ.jpeg",
          "duracao":140
      },
      {
          "id": 3,
          "titulo": "Batman",
          "resumo":"Eu sou o Batman, Julius Brooklyn 1986",
          "atores":"Robert Pattinson",
          "capa":"https://i0.wp.com/tracklist.com.br/wp-content/uploads/2022/01/Batman-cartaz.jpg?fit=758%2C948&ssl=1",
          "duracao":120
      },
      {
          "id": 4,
          "titulo": "Mulher Maravilha",
          "resumo":"Filme da Mulher Maravilha, é dento",
          "atores":"Gal Gadot",
          "capa":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_-Coz7aGQhxiL4qGLx5sSIQo7QTU34rOX2SvUqMqNTRtAlM0r_81iKAD0viZgIPCPxxs&usqp=CAU",
          "duracao":160
      },
      {
          "id": 5,
          "titulo": "Coringa",
          "resumo":"Só Deus sabe como ta a mente do palhaço",
          "atores":"Jared Leto",
          "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/6/63/Joker_%282019%29.jpg/250px-Joker_%282019%29.jpg",
          "duracao":150
      },
      {
          "id": 6,
          "titulo": "Thor",
          "resumo":"Campeao do arremesso de martelo",
          "atores":"Chris Hemsworth",
          "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/9/9f/Thor_Poster.jpg/250px-Thor_Poster.jpg",
          "duracao":130
      }
    ]
    ''';
  // Definindo um método assíncrono para buscar filmes offline.
  Future<List<Filme>> getFilmesOffline() async {
    // Decodificando a string JSON para um objeto Dart.
    final json = jsonDecode(respostaApi);

    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    for (var map in mapsFilme) {
      Filme filme = Filme.fromJson(map);
      listFilmes.add(filme);
    }

    // Delay simulado de 1 segundo (para simular o tempo de resposta da API).
    await Future.delayed(const Duration(seconds: 1));

    // Retornando a lista de filmes após o processo.
    return listFilmes;
  }
}
