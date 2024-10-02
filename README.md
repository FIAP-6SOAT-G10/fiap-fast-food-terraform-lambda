# FIAP Fast Food Terraform Lambda

Este repositório contém a infraestrutura como código (IaC) para o projeto FIAP Fast Food, utilizando Terraform para gerenciar recursos AWS, incluindo funções Lambda, API Gateway e buckets S3.

## Estrutura do Projeto

- **`api-gateway-auth.tf`**: Configurações do API Gateway para a função de autenticação.
- **`api-gateway-login.tf`**: Configurações do API Gateway para a função de login.
- **`bucket-auth.tf`**: Configurações do bucket S3 para a função de autenticação.
- **`bucket-login.tf`**: Configurações do bucket S3 para a função de login.
- **`data.tf`**: Definições de dados, como arquivos de archive e informações da API Gateway.
- **`lambda-auth.tf`**: Configurações da função Lambda de autenticação.
- **`lambda-login.tf`**: Configurações da função Lambda de login.
- **`output.tf`**: Definições de valores de saída.
- **`variables.tf`**: Definições de variáveis.
- **`versions.tf`**: Configurações de versões dos provedores Terraform.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) v1.0.0 ou superior
- AWS CLI configurado
- Credenciais AWS com permissões adequadas

## Configuração

1. Clone este repositório:
    ```sh
    git clone https://github.com/FIAP-6SOAT-G10/fiap-fast-food-terraform-lambda.git
    cd fiap-fast-food-terraform-lambda
    ```

2. Inicialize o Terraform:
    ```sh
    terraform init
    ```

3. Crie um plano de execução:
    ```sh
    terraform plan -out=tfplan
    ```

4. Aplique o plano:
    ```sh
    terraform apply tfplan
    ```

## Estrutura do Workflow do GitHub Actions

O workflow de deploy (`.github/workflows/deploy.yaml`) realiza as seguintes etapas:

1. Faz o checkout do código.
2. Configura as credenciais AWS.
3. Cria os diretórios `handler/auth` e `handler/login`.
4. Clona os repositórios de autorização e login.
5. Lista o conteúdo do diretório `handler`.
6. Instala o Terraform.
7. Inicializa o Terraform.
8. Executa o plano e aplica as mudanças.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Para mais informações, entre em contato com os mantenedores do projeto.
