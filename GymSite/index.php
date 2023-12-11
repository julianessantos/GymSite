
<?php
    include('config.php');
    Mysql::conectar();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/style_login.css"> <!-- Corrigido o caminho do arquivo CSS -->
    <title>Login</title>
</head>
<body>
    <div class="main-login">
        <div class="esquerda-login">
            <h1>Bem-vindo de volta</h1>
            <img src="Imagens/moca_peso.svg" class="esquerda-img-login" alt="moça levantando peso">
        </div>
            <form action="classes\login.php" method="POST">
                <div class="direita-login">
                    <div class="card-login">
                        <h1>Login</h1>
                        <div class="textfield">
                            <label for="cpf">CPF</label>
                            <input type="text" name="cpf" placeholder="CPF">
                        </div>
                        <div class="textfield">
                            <label for="senha">Senha</label>
                            <input type="password" name="senha" placeholder="Senha">
                        </div>
                        <button type="submit" class="btn-login">Entrar</button>
                        <ul class="login-uteis">
                            <li class="btn-uteis-login">
                                <span class="esq-login">Esqueceu sua </span>
                                <a href="#" class="eqc-senha">Senha? </a>
                            </li>
                            <li>
                                <span class="cria-login"> Não possui conta? </span> 
                                <a href="criar_login.html" class="cri-login">  Criar! </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>