
package uytube.web.wsclients;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtListaParticulares complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtListaParticulares">
 *   &lt;complexContent>
 *     &lt;extension base="{http://interfaces/}dtListaReproduccion">
 *       &lt;sequence>
 *         &lt;element name="privado" type="{http://www.w3.org/2001/XMLSchema}boolean" minOccurs="0"/>
 *         &lt;element name="categoria" type="{http://interfaces/}dtCategoria" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtListaParticulares", propOrder = {
    "privado",
    "categoria"
})
public class DtListaParticulares
    extends DtListaReproduccion
{

    protected Boolean privado;
    protected DtCategoria categoria;

    /**
     * Obtiene el valor de la propiedad privado.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isPrivado() {
        return privado;
    }

    /**
     * Define el valor de la propiedad privado.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setPrivado(Boolean value) {
        this.privado = value;
    }

    /**
     * Obtiene el valor de la propiedad categoria.
     * 
     * @return
     *     possible object is
     *     {@link DtCategoria }
     *     
     */
    public DtCategoria getCategoria() {
        return categoria;
    }

    /**
     * Define el valor de la propiedad categoria.
     * 
     * @param value
     *     allowed object is
     *     {@link DtCategoria }
     *     
     */
    public void setCategoria(DtCategoria value) {
        this.categoria = value;
    }

}
