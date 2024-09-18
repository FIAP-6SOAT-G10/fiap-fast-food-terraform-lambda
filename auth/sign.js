const { CognitoIdentityProviderClient, InitiateAuthCommand } = require("@aws-sdk/client-cognito-identity-provider");

async function signIn(poolId, clientId, username) {
    let client = new CognitoIdentityProviderClient({});
    let input = {
        UserPoolId: poolId,
        ClientId: clientId,
        AuthFlow: "USER_PASSWORD_AUTH",
        AuthParameters: {
            "USERNAME": username,
            "PASSWORD": username
        },
    };
    const command = new InitiateAuthCommand(input);
    const response = await client.send(command);
    console.log(JSON.stringify(response));
}

module.exports = signIn;