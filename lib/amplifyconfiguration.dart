const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "removed",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "removed",
                        "AppClientId": "removed",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                           "WebDomain": "removed",
                           "AppClientId": "removed",
                           "SignInRedirectURI": "myapp://",
                           "SignOutRedirectURI": "myapp://",
                           "Scopes": [
                               "phone",
                               "email",
                               "openid",
                               "profile",
                               "aws.cognito.signin.user.admin"
                           ]
                        },


                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [
                            "GOOGLE"
                        ],
                        "usernameAttributes": [],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';
