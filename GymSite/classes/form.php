<?php
    class Form{
        public static function alert($tipo,$mensagem){
            if($tipo=='erro'){
                echo '<div>' .$mensagem. '</div>';
                return false;
            }else if($tipo == 'sucesso'){
                echo '<div>' .$mensagem. '</div>';
                return true;
            }
        }
        public static function cadastrar($cpf, $nome, $nascimento, $telefone, $email, $senha){
            $sql = Mysql::conectar()->prepare("INSERT INTO `usuario` VALUES (?,?,?,?,?,?)");
            $sql-> execute(array($cpf, $nome, $nascimento, $telefone, $email, $senha));
        }
    }
?>