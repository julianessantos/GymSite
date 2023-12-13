<?php

    include('config.php');
    Mysql::conectar();

    session_start();
    if(empty($_SESSION)){
        print "<script>location.href='index.php';</script>";
    }

    //$consulta = "SELECT * FROM produto";
    $consulta = "SELECT USUARIO.nome, EXERCICIO.nome_exer, TREINO.serie, TREINO.rept, TREINO.tipo_de_treino FROM TREINO INNER JOIN EXERCICIO ON TREINO.id_exercicio = EXERCICIO.id_exercicio INNER JOIN CLIENTE_ALUNO ON TREINO.id_cliente = CLIENTE_ALUNO.id_cliente INNER JOIN USUARIO ON CLIENTE_ALUNO.cpf_cliente = USUARIO.cpf";
    $resultado= $conn ->query($consulta) or die($conn->error);

    
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS\style_dashboard.css">
    <title>Dashboard</title>
</head>
<body>
    <div class="menu">
        <ul>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="tennisball-outline"></ion-icon></span>
                    <span class="title">GymSite</span>
                </a>
            </li>
            <li>
                <a href="dashboard.html">
                    <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                    <span class="title">Home</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <span class="title">Pefil</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="clipboard-outline"></ion-icon></span>
                    <span class="title">Avaliação Corporal</span>
                </a>
            </li>
            <li>
                <a href="treinoA.html">
                    <span class="icon"><ion-icon name="barbell-outline"></ion-icon></span>
                    <span class="title">Treino</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="calendar-outline"></ion-icon></span>
                    <span class="title">Frequência</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="bag-outline"></ion-icon></span>
                    <span class="title">Loja</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><ion-icon name="card-outline"></ion-icon></span>
                    <span class="title">Pagamento</span>
                </a>
            </li>
            <li>
                <?php
                    print"<a href='classes\logout.php'>
                    <span class='icon'><ion-icon name='log-out-outline'></ion-icon></span>
                    <span class='title'>Sing Out</span></a>";

                ?>
            </li>
        </ul>
        <div class="toggle"></div>

        <!--main-->
    </div>

    <div class="main">
        <div class="topbar">
            <div class="user">
                <img src="/Imagens/profile_user.jpg" alt="user">
            </div>
        </div>
    </div>
    
   <!-- tabela
    <div class="tabela">
        <table>
            <tr>
                <td>id_produto</td>
                <td>nome_produto</td>
                <td>preco</td>
                <td>quantidade</td>
            </tr>

            <?php while($dado = $resultado ->fetch_array()){ ?>
                <tr>
                    <td><?php echo $dado["nome_produto"]; ?></td>
                    <td><?php echo $dado["preco"]; ?></td>
                    <td><?php echo $dado["quantidade"]; ?></td>
                </tr>
            <?php }?>
        </table>
    </div>
    -->

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <script>
        let menu = document.querySelector('.menu');
        let toggle = document.querySelector('.toggle');
        let links = document.querySelectorAll('.menu li a');

        function activeLink() {
            links.forEach((item) => item.classList.remove('hovered'));
            this.classList.add('hovered');
        }

        links.forEach((item) => item.addEventListener('mouseover', activeLink));

        toggle.onclick = function() {
            menu.classList.toggle('active');
        }
    </script>
</body>
</html>