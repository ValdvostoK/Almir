<?php
   include_once $_SERVER['DOCUMENT_ROOT'] . "/lpphpbcc2026/DAL/conexao.php"; 
   include_once $_SERVER['DOCUMENT_ROOT'] . "/lpphpbcc2026/MODEL/agricultor.php"; 

    use DAL\Conexao;

class Agricultor{

    public function Select(){
        $sql = "Select * from agricultor;";
        $con = DAL\Conexao::conectar(); 
        $registros = $con->query($sql);  
        $con = DAL\Conexao::desconectar(); 

        foreach($regirstros as $linha){
            $agricultor = new \MODEL\Agricultor();
            $agricultor->setId($linha['id']);
            $agricultor->setNome($linha['nome']);
            $agricultor->setCidade($linha['cidade']);
            $agricultor->setBairro($linha['bairro']);
            $agricultor->setIdade($linha['idade']);

            $lstAgricultor[] = $agricultor;
        }

        return $lstAgricultor;
    }

}


   $sql = "Select * from tipoinsumo;";
   $con = DAL\Conexao::conectar(); 
   $registros = $con->query($sql);  
   $con = DAL\Conexao::desconectar();  
?>