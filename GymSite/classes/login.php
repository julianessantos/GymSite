<?php
    session_start();
    
    if(empty($_POST) or (empty($_POST["cpf"]) or (empty($_POST["senha"])))){
        print "<script>location.href='/GymSite/index.php';</script>";
    }

    include('../config.php');

    $cpf = $_POST["cpf"];
    $senha = $_POST["senha"];

    $sql = "SELECT * FROM usuario
            WHERE cpf = '{$cpf}'
            AND senha = '{$senha}'";

    $res = $conn ->query($sql) or die($conn->error);

    $row = $res->fetch_object();

    $qtd = $res->num_rows;

    if($qtd>0){
        $_SESSION["cpf"] = $cpf;
        $_SESSION["senha"] = $senha;
        print "<script>location.href='/GymSite/dashboard.php';</script>";
    }else{
        print"<script>alert('usuario ou senha incorretos');</script>";
        print "<script>location.href='/GymSite/index.php';</script>";

    }
?>
