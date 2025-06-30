// Si el player está por debajo (más abajo en Y), este objeto se dibuja por delante
if (obj_golosin.y > y) {
    depth = obj_golosin.depth - 1; // Más cercano al frente
} else {
    depth = obj_golosin.depth + 1; // Detrás del player
}
