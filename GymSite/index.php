
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
                            <input type="text" maxlength="11" name="cpf" placeholder="CPF">
                        </div>
                        <div class="textfield">
                            <label for="senha">Senha</label>
                            <input type="password" maxlength="16" name="senha" placeholder="Senha">
                        </div>
                        <button type="submit" class="btn-login">Entrar</button>
                        <ul class="login-uteis">
                            <li class="btn-uteis-login">
                                <span class="esq-login">Esqueceu sua </span>
                                <a href="#" class="eqc-senha">Senha? </a>
                            </li>
                            <li>
                                <?php
                                    print"<span class='cria-login'> Não possui conta? </span> 
                                    <a href='criar_login.php' class='cri-login'>  Criar! </a>";
                                ?>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>