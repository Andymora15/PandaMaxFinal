package com.productos.negocio;

import java.io.Serializable;

public class ProductoCarrito implements Serializable {
    private int id;
    private String nombre;
    private double precio;
    private int cantidad;

    public ProductoCarrito(int id, String nombre, double precio, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    // Getters y Setters
    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public double getPrecio() { return precio; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
}
