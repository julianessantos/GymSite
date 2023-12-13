<?php
    session_start();

    unset($_SESSION["cpf"]);
    unset($_SESSION["senha"]);
    
    session_destroy();

    echo "<script>window.location.href='/GymSite/index.php';</script>";
    exit;
?>