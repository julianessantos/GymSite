<?php
    include('config.php');
    Mysql::conectar();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/style_treinoA.css">
    <title>TreinoA</title>
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
                <a href="#">
                    <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                    <span class="title">Sing Out</span>
                </a>
            </li>
        </ul>
        <div class="toggle"></div>
    </div>
    <!--treino-->
    <div class="treinos">
       <div class="select">
            <select class="select-box">
                <option value="">Selecione a modalidade</option>
                <option value="musculacao">Musculaçao</option>
                <option value="boxe">Boxe</option>
            </select>
       </div> 
    </div>
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