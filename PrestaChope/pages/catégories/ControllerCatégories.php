<?php

require_once('DAO/CatégoriesDAO.php');

class ControllerCatégories {

    function includeViewCatégories(){
        require_once ('Catégories.php');
    }
    
    static function searchSousCatégories($id) {
        return CatégoriesDAO::SearchSousCatégories($id);
    }
    
    function modifCatégorie($nom, $description,$sousCaté,$idcaté,$idsouscaté){
        CatégoriesDAO::modifCatégorie($nom, $description, $sousCaté, $idcaté,$idsouscaté);
    }
    
    function deleteCatégorie($id){
        CatégoriesDAO::deleteCatégorie($id);
    }
    
    
    function créationCatégorie($nom, $description,$sousCaté) {
        CatégoriesDAO::créationCatégorie($nom, $description,$sousCaté);
    }
    
    function includeViewModifCatégorie(){
        require_once('ModifCatégorie.php');
    }
    
    function includeViewCréationCatégorie(){
        require_once('CréationCatégorie.php');
    }
}