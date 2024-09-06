import http from 'http';

export const loadUserByUsername = async (event) => {
  return init(event.cpf);
}

function init(username) {
    var options = {
        host: 'localhost',
        port: '30000',
        path: `/api/clientes?cpf=${username}`,
        method: 'GET'
    };

    console.log(`${username}`);
    var req = http.get(options, function(res) {
        if (res.statusCode != 200) {
            console.log('Usuário não encontrado');
            return;
        }
        
        //chamada ao próximo AWS Lambda
    });
}