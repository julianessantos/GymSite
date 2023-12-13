<?php
    class Form{
        public static function alert($tipo,$mensagem){
            if($tipo=='erro'){
                echo '<div>' .$mensagem. '</div>';
                return false;
            }else if($tipo == 'sucesso'){
                header("Location: /GymSite/index.php");
                echo '<div>' .$mensagem. '</div>';
                echo "<script>window.location.href='/GymSite/index.php';</script>";
                return true;
            }
        }
        public static function cadastrar($cpf, $nome, $nascimento, $telefone, $email, $senha){
            $sql = Mysql::conectar()->prepare("INSERT INTO `usuario` VALUES (?,?,?,?,?,?)");
            $sql-> execute(array($cpf, $nome, $nascimento, $telefone, $email, $senha));
        }

        /*if(tipo_modalida == G){
            public static function cadastrar($cpf, $nome, $nascimento, $telefone, $email, $senha){
                $sql = Mysql::conectar()->prepare("INSERT INTO `usuario` VALUES (?,?,?,?,?,?)");
                $sql-> execute(array($cpf, $nome, $nascimento, $telefone, $email, $senha));
                //$sql = Mysql::conectar()->prepare("INSERT INTO `gerente (cpf_gerente)` VALUES (?)");
                //$sql-> execute(array($cpf));
            }
        }*/
    }
?>