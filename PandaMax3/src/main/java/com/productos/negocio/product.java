package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.Conexion;

public class product {
	
	
	public String consultarTodo()
	{
	String sql="SELECT * FROM tb_producto ORDER BY id_pr";
	Conexion con=new Conexion();
	String tabla="<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
			ResultSet rs=null;
			rs=con.Consulta(sql);
			try {
				while(rs.next())
				{
					tabla+="<tr><td>"+rs.getInt(1)+"</td>"
							+ "<td>"+rs.getString(3)+"</td>"
							+ "<td>"+rs.getInt(4)+"</td>"
							+ "<td>"+rs.getDouble(5)+"</td>"
							+ "</td></tr>";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.print(e.getMessage());
			}
			tabla+="</table>";
			return tabla;
	}
	
	public String buscarProductoCategoria(int cat)
	{
	String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
	Conexion con=new Conexion();
	ResultSet rs=null;
	String resultado="<table border=3>";
	try
	{
	rs=con.Consulta(sentencia);
	while(rs.next())
	{
	resultado+="<tr><td>"+ rs.getString(1)+"</td>"
	+ "<td>"+rs.getDouble(2)+"</td></tr>";
	}
	resultado+="</table>";
	}
	catch(SQLException e)
	{
	System.out.print(e.getMessage());
	}
	System.out.print(resultado);
	return resultado;
	}
	
	public String reporteProducto(){
		  String sql="SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr " +
		             "FROM tb_producto pr, tb_categoria cat WHERE pr.id_cat=cat.id_cat;";
		  Conexion cn=new Conexion();
		  String tabla="<table class='table'><thead><tr>" +
		               "<th scope='col'>ID</th>" +
		               "<th scope='col'>Descripción</th>" +
		               "<th scope='col'>Categoria</th>" +
		               "<th scope='col'>Cantidad</th>" +
		               "<th scope='col'>Precio</th>" +
		               "<th scope='col'>Modificar</th>" +
		               "<th scope='col'>Eliminar</th>" +
		               "</tr></thead><tbody>";
		  ResultSet rs=null;
		  rs=cn.Consulta(sql);
		  try {
		    while(rs.next()){
		      tabla+="<tr><th scope='row'>"+rs.getInt(1)+"</th>";
		      tabla+="<td>"+rs.getString(2)+"</td>";
		      tabla+="<td>"+rs.getString(3)+"</td>";
		      tabla+="<td>"+rs.getInt(4)+"</td>";
		      tabla+="<td>"+rs.getDouble(5)+"</td>";
		      tabla+="<td><a href='actualizar.jsp?id="+rs.getInt(1)+"'>Actualizar</a></td>";
		      tabla+="<td><a href='eliminar.jsp?id="+rs.getInt(1)+"'>Eliminar</a></td></tr>";
		    }
		    tabla+="</tbody></table>";
		  } catch (SQLException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		  }
		  return tabla;
		}
	
	
	

	
	
}
