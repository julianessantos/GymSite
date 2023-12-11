<?php
    include('config.php');
    Mysql::conectar();
    
    $cpf = $nome = $nascimento = $telefone = $email = $senha = '';  // Inicialize as variáveis

    if(isset($_POST['acao']) && $_POST['form'] == 'f_form'){
        $cpf = $_POST['cpf'];
        $nome = $_POST['name'];
        $nascimento = $_POST['data_nasc'];
        $telefone = $_POST['telefone'];
        $email = $_POST['email'];
        $senha = $_POST['password'];
    }

    if($cpf == ''){
        Form::alert('Erro', 'O cpf não foi digitado');
    } else if($nome == ''){
        Form::alert('Erro', 'O nome não foi digitado');
    } else if($nascimento == ''){
        Form::alert('Erro', 'A data de nascimento não foi digitada');
    } else if($telefone == ''){
        Form::alert('Erro', 'O telefone não foi digitado');
    } else if($email == ''){
        Form::alert('Erro', 'O email não foi digitado');
    } else if($senha == ''){
        Form::alert('Erro', 'A senha não foi digitada');
    } else {
        Form::cadastrar($cpf, $nome, $nascimento, $telefone, $email, $senha);
        Form::alert('sucesso', 'Usuario cadastrado');
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/style_criar_login.css">
    <title>Criar-login</title>
</head>
<body>
    <div class="container">
        <div class="form">
            <form method="POST">
                <div class="form-header">
                    <div>
                        <h1>Cadastre-se</h1>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-box">
                        <label for="name">Nome completo</label>
                        <input type="text" name="name" id="name" placeholder="Digite seu nome" required>
                    </div>

                    <div class="input-box">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Digite seu email" required>
                    </div>

                    <div class="input-box">
                        <label for="cpf">CPF</label>
                        <input type="text" maxlength="11" name="cpf" id="cpf" placeholder="12345678900" required>
                    </div>

                    <div class="input-box">
                        <label for="telefone">Telefone</label>
                        <input type="tel" name="telefone" id="telefone" placeholder="(xx) 9xxxx-xxxx" required>
                    </div>

                    <div class="input-box">
                        <label for="password">Senha</label>
                        <input type="password" name="password" id="password" placeholder="Digite sua senha" required>
                    </div>

                    <div class="input-box">
                        <label for="data_nasc">Data de nascimento</label>
                        <input type="date" name="data_nasc" id="data_nasc" placeholder="Data de Nacimento" required>
                    </div>
                </div>

                <div class="continue-button">
                    <button>
                        <input type="submit" name="acao" value="Cadastrar">
                    </button>
                </div>

                <input type="hidden" name="form" value = "f_form">

            </form>
        </div>
        <div class="form-image">
            <img src="Imagens\workout-animate.svg" alt="Moça correndo">
        </div>
    </div>
</body>
</html>