<?php

class ProduitsDTO {

    private $id;
    private $nom;
    private $description;
    private $prix;
    private $stock;
    private $image;

    function getId() {
        return $this->id;
    }

    function getNom() {
        return $this->nom;
    }

    function getDescription() {
        return $this->description;
    }

    function getPrix() {
        return $this->prix;
    }

    function getStock() {
        return $this->stock;
    }

    function getImage() {
        return $this->image;
    }

    function setId($id): void {
        $this->id = $id;
    }

    function setNom($nom): void {
        $this->nom = $nom;
    }

    function setDescription($description): void {
        $this->description = $description;
    }

    function setPrix($prix): void {
        $this->prix = $prix;
    }

    function setStock($stock): void {
        $this->stock = $stock;
    }

    function setImage($image): void {
        $this->image = $image;
    }

}
