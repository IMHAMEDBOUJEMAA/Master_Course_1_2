// Récupération des éléments HTML nécessaires
const slideshowImages = document.querySelectorAll(".slideshow");
const backgroundImages = document.querySelectorAll(".background-image img");

// Variable pour suivre l'index de l'image active
let currentImageIndex = 0;

// Fonction pour afficher l'image suivante
function showNextImage() {
  // Cacher l'image active
  slideshowImages[currentImageIndex].classList.remove("active");

  // Passer à l'image suivante
  currentImageIndex = (currentImageIndex + 1) % slideshowImages.length;

  // Afficher l'image suivante
  slideshowImages[currentImageIndex].classList.add("active");

  // Mettre à jour l'image de fond correspondante
  backgroundImages.forEach((image, index) => {
    if (index === currentImageIndex) {
      image.classList.add("active");
    } else {
      image.classList.remove("active");
    }
  });
}

// Afficher la première image et démarrer le diaporama
slideshowImages[0].classList.add("active");
backgroundImages[0].classList.add("active");
setInterval(showNextImage, 5000); // Afficher l'image suivante toutes les 5 secondes



